module ApplicationHelper
	# Returns the full title on a per-page basis.
	def full_title(page_title = '')
		base_title = "Justin White"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end

	# reutrns link_to with font-awesome tag applied
 	def link_to_fa(text, link, icon_name)
  	link_to content_tag(:i, "&nbsp; ".html_safe + " " + text, :class => "fa fa-#{icon_name}"), link
	end

end
