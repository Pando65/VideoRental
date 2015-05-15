# MoneyInput render for simple form datepickers
class MoneyInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options)
    set_input_options
    super(wrapper_options) # leave StringInput do the real rendering
  end

  def input_html_classes
    super.push ''   # 'form-control'
  end

  private

  def set_input_options
    set_input_html_options_value

    input_html_options[:type] = 'text'
    input_html_options[:data] ||= {}
    input_html_options[:data].merge!('inputmask' => '"alias":"currency"')
  end

  def set_input_html_options_value
    value = object.send(attribute_name) if object.respond_to? attribute_name
    input_html_options[:value] ||=  value if value.present?
  end
end
