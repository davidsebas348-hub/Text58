--== Roblox Raw Script: Destruir automáticamente Barry, Door y Wall específico ==--

local Workspace = game:GetService("Workspace")

-- Función para destruir Barry
local function destruirBarry(obj)
    if obj:IsA("Model") and obj.Name == "Barry" then
        obj:Destroy()
        print("Barry destruido automáticamente ✅")
    end
end

-- Función para destruir Door (dentro de M_Chef_Door)
local function destruirDoor(obj)
    if obj:IsA("MeshPart") and obj.Name == "Door" and obj.Parent and obj.Parent.Name == "M_Chef_Door" then
        obj:Destroy()
        print("Door destruido automáticamente ✅")
    end
end

-- Función para destruir Wall específico (hijo directo de Door)
local function destruirWallEspecifico(obj)
    if obj:IsA("MeshPart") and obj.Name == "wall" and obj.Parent and obj.Parent.Name == "Door" then
        obj:Destroy()
        print("Wall específico destruido automáticamente ✅")
    end
end

-- Función que revisa un objeto y aplica todas las reglas
local function revisarObjeto(obj)
    destruirBarry(obj)
    destruirDoor(obj)
    destruirWallEspecifico(obj)
end

-- Revisar todo el Workspace al inicio
for _, obj in pairs(Workspace:GetDescendants()) do
    revisarObjeto(obj)
end

-- Detectar nuevos objetos que aparezcan en Workspace
Workspace.DescendantAdded:Connect(function(obj)
    revisarObjeto(obj)
end)
