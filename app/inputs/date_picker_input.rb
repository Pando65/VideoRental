# DatePickerInput render for simple form datepickers
class DatePickerInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options)
    set_input_options
    template.content_tag :div, class: 'input-group date date_picker' do
      input = super(wrapper_options) # leave StringInput do the real rendering
      input + template.content_tag(:span, class: 'input-group-btn') do
        template.content_tag :button, class: 'btn btn-default',
                                      type: 'button' do
          template.content_tag :span, '', class: 'fa fa-calendar'
        end
      end
      # input
    end
  end

  def input_html_classes
    super.push ''   # 'form-control'
  end

  private

  def set_input_options
    set_input_html_options_value

    input_html_options[:type] = 'text'
    input_html_options[:data] ||= {}
    input_html_options[:data].merge!(date_format: picker_pettern,
                                     date_language: I18n.locale.to_s,
                                     date_weekstart: I18n.t(
                                       'datepicker.weekstart',
                                       default: 0))
  end

  def set_input_html_options_value
    value = object.send(attribute_name) if object.respond_to? attribute_name
    input_html_options[:value] ||= I18n.localize(value,
                                                 format: display_pattern
                                                ) if value.present?
  end

  def display_pattern
    I18n.t('datepicker.dformat', default: '%d/%m/%Y')
  end

  def picker_pettern
    I18n.t('datepicker.pformat', default: 'DD/MM/YYYY')
  end
end
