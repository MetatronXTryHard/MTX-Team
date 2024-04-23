	local CustomColorUI = Library.CreateCustomColor("Settins | Custom UI")

	local CCMain = CustomColorUI.CreateSection("Main")
	CCMain.CreateColorPicker({Title = "Border Color", Type = "Border Color"})
	CCMain.CreateColorPicker({Title = "Click Effect Color", Type = "Click Effect Color"})
	CCMain.CreateColorPicker({Title = "Setting Icon Color", Type = "Setting Icon Color"})
	CCMain.CreateBox({Title = 'Logo Image', Placeholder = 'URL Here (PNG only), Recommended 128x128', Type = "Logo Image"})
	
	local CCSearch = CustomColorUI.CreateSection("Search")
	CCSearch.CreateColorPicker({Title = "Search Icon Color", Type = "Search Icon Color"})
	CCSearch.CreateColorPicker({Title = "Search Icon Highlight Color", Type = "Search Icon Highlight Color"})
	
	local CCText = CustomColorUI.CreateSection("Text")
	CCText.CreateColorPicker({Title = "GUI Text Color", Type = "GUI Text Color"})
	CCText.CreateColorPicker({Title = "Text Color", Type = "Text Color"})
	CCText.CreateColorPicker({Title = "Placeholder Text Color", Type = "Placeholder Text Color"})
	CCText.CreateColorPicker({Title = "Title Text Color", Type = "Title Text Color"})
	
	local CCBackground = CustomColorUI.CreateSection("Background")
	CCBackground.CreateColorPicker({Title = "Background 1 Color", Type = "Background 1 Color"})
	CCBackground.CreateSlider({Title = 'Background 1 Transparency', Type = "Background 1 Transparency", Min = 0, Max = 1, Default = 0, Precise = true})
	CCBackground.CreateColorPicker({Title = "Background 2 Color", Type = "Background 2 Color"})
	CCBackground.CreateColorPicker({Title = "Background 3 Color", Type = "Background 3 Color"})
	CCBackground.CreateBox({Title = 'Background Image', Placeholder = 'URL Here (WEBM / PNG only), Recommended 1280x720', Type = "Background Image"})
	
	local CCPage = CustomColorUI.CreateSection("Page")
	CCPage.CreateColorPicker({Title = "Page Selected Color", Type = "Page Selected Color"})
	
	local CCSection = CustomColorUI.CreateSection("Section")
	CCSection.CreateColorPicker({Title = "Section Text Color", Type = "Section Text Color"})
	CCSection.CreateColorPicker({Title = "Section Underline Color", Type = "Section Underline Color"})
	
	local CCToggle = CustomColorUI.CreateSection("Toggle")
	CCToggle.CreateColorPicker({Title = "Toggle Border Color", Type = "Toggle Border Color"})
	CCToggle.CreateColorPicker({Title = "Toggle Checked Color", Type = "Toggle Checked Color"})
	CCToggle.CreateColorPicker({Title = "Toggle Desc Color", Type = "Toggle Desc Color"})
	
	local CCButton = CustomColorUI.CreateSection("Button")
	CCButton.CreateColorPicker({Title = "Button Color", Type = "Button Color"})
	
	local CCButton = CustomColorUI.CreateSection("Label")
	CCButton.CreateColorPicker({Title = "Label Color", Type = "Label Color"})
	
	local CCDropdown = CustomColorUI.CreateSection("Dropdown")
	CCDropdown.CreateColorPicker({Title = "Dropdown Icon Color", Type = "Dropdown Icon Color"})
	CCDropdown.CreateColorPicker({Title = "Dropdown Selected Color", Type = "Dropdown Selected Color"})
	
	local CCTextbox = CustomColorUI.CreateSection("Textbox")
	CCTextbox.CreateColorPicker({Title = "Textbox Highlight Color", Type = "Textbox Highlight Color"})
	
	local CCBox = CustomColorUI.CreateSection("Box")
	CCBox.CreateColorPicker({Title = "Box Highlight Color", Type = "Box Highlight Color"})
	
	local CCSlider = CustomColorUI.CreateSection("Slider")
	CCSlider.CreateColorPicker({Title = "Slider Line Color", Type = "Slider Line Color"})
	CCSlider.CreateColorPicker({Title = "Slider Highlight Color", Type = "Slider Highlight Color"})
	
	local CCAnimation = CustomColorUI.CreateSection("Animation")
	CCAnimation.CreateSlider({Title = 'Tween Animation 1 Speed', Type = "Tween Animation 1 Speed", Min = 0, Max = 0.75, Default = 0.25, Precise = true})
	CCAnimation.CreateSlider({Title = 'Tween Animation 2 Speed', Type = "Tween Animation 2 Speed", Min = 0, Max = 1, Default = 0.5, Precise = true})
	CCAnimation.CreateSlider({Title = 'Tween Animation 3 Speed', Type = "Tween Animation 3 Speed", Min = 0, Max = 0.5, Default = 0.1, Precise = true})
