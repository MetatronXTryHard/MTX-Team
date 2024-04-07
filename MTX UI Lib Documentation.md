
# MTX Client UI Interface Suite (MTX UI)

its very pro trust me bro

![image](https://github.com/GamingScripter/Darkrai-Y/assets/102379753/c075d655-f42e-4445-870d-f6579ae0c0b0)
![image](https://github.com/GamingScripter/Darkrai-Y/assets/102379753/53caccd0-2d9f-47f1-bfdd-a109549ff680)
![image](https://github.com/GamingScripter/Darkrai-Y/assets/102379753/1fde4956-cdd6-41c0-94ec-ab60225673ef)


## Table of Contents

- [Importing](#importing)
- [Creating Library](#creating-library)
  - [Window](#create-window)
  - [Tab](#create-tab)
  - [Section](#create-sections)
- [Creating Elements](#creating-elements)
  - [Button](#button)
  - [Toggle](#toggle)
  - [Textbox](#textbox)
  - [Slider](#slider)
  - [Dropdown](#dropdown)
  - [Color Picker](#color-picker)
- [Other Elements](#other-elements)
  - [Text Label](#text-label)
  - [Paragraph](#paragraph)
  - [Card](#card)
- [Notification](#notification)
  - [Side Notifications](#side-notifications)
  - [Window Notifications](#window-notifications)

## Importing

### 1. Import the module:
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/MetatronXTryHard/MTX-Team/main/MTX%20Team%20Realise%20UI%20Lib"))()
```

## Creating Library

### Create Window

Example:


![image](https://github.com/GamingScripter/Darkrai-Y/assets/102379753/b9ec4810-8e2f-4b7a-89b6-134cc3fca0a8)


```lua
local Main_Function = Library.CreateMain({Title = 'Main', Desc = 'Powered By MTX-Team'})
```

___

### Create Tab

Example:


![image](https://github.com/GamingScripter/Darkrai-Y/assets/102379753/ee9c99c6-de39-4646-ac9c-367fa887c9aa)


```lua
local F = Main_Function.CreatePage({Page_Name = 'Farm', Page_Title = 'Farm | Options'})
```

___

### Create Sections

#### Normal Section:


Example:


![image](https://github.com/GamingScripter/Darkrai-Y/assets/102379753/1d58fd6e-dcaa-4a17-bf80-b13614483522)


```lua
local Section1 = F.CreateSection("Section1")
```

## Creating Elements

### Button

Example:


![image](https://github.com/GamingScripter/Darkrai-Y/assets/102379753/a52452ff-4eb6-4959-a336-5caaf0b4668a)


```lua
Section1.CreateButton({
   Title = "Meu buttom"}, function(state)
    print("O estado do buttom é: " .. tostring(state))
end)
```

---

### Toggle

#### Switch Toggle

Example:


![image](https://github.com/GamingScripter/Darkrai-Y/assets/102379753/28959316-2284-42e1-92fa-ec63c39e0782)


```lua
Section1.CreateToggle({
    Title = "Meu Toggle",
    Desc = "Descrição do meu Toggle",
    Default = false}, function(state)
    print("O estado do Toggle é: " .. tostring(state))
end)
```

### Textbox

Example:


![image](https://github.com/GamingScripter/Darkrai-Y/assets/102379753/ecc9407c-138e-4e2c-921e-a9c2b4227e9a)


```lua
Section1.CreateBox({
    Title = "Meu Título",
    Placeholder = "Digite algo aqui...",
    Default = "Texto padrão",
    Number = true}, function(text)
    print("O texto inserido é: " .. text)
end)
```

---

### Slider

Example:


![image](https://github.com/GamingScripter/Darkrai-Y/assets/102379753/5e074ca0-0600-4192-b926-66914c46a625)


```lua
Section1.CreateSlider({
    Title = "Meu Slider",
    Min = 0,
    Max = 100,
    Precise = true,
    Default = 50}, function(value)
    print("O valor do slider é: " .. value)
end)
```

---

### Dropdown

Example:


![image](https://github.com/GamingScripter/Darkrai-Y/assets/102379753/699ef030-f26f-48bd-b9ea-c07fb4839674)


```lua
Section1.CreateDropdown({
    Title = "Meu Dropdown",
    List = {"Opção 1", "Opção 2", "Opção 3"},
    Search = true,
    Selected = "Opção 1",
    Default = "Opção 2"}, function(selectedOption)
    print("A opção selecionada é: " .. selectedOption)
end)
```

## Other Elements

### Text Label

Example:


![image](https://github.com/GamingScripter/Darkrai-Y/assets/102379753/6a5e977a-2f48-4e40-be1a-c195ed8fa400)


```lua
local Label Section1.CreateLabel({Title = "Label"})
```

## Notification

### Side Notifications

Example:


![image](https://github.com/GamingScripter/Darkrai-Y/assets/102379753/a7c6312a-74e0-4cc1-8c9c-fc4632cfebea)


```lua
Library.CreateNoti({Title = 'UI', Desc = 'MTX Client Loaded...', ShowTime = 5})
```
