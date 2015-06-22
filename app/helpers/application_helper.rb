class StrongParametersFormBuilder < SimpleForm::FormBuilder

	def input(attribute_name, *args, &block)
			display_filter = self.options[:display_only]

			if display_filter
				super if display_filter.include?(attribute_name)
			else
				super
			end
		end
end






module ApplicationHelper
	def number_with_precision(number, options = {})
		delegate_number_helper_method(:number_to_rounded, number, options)
	end

	def filtered_form_for(object, options = {}, &block)
		simple_form_for(object, options.merge(:builder => StrongParametersFormBuilder), &block)
	end
	

end
