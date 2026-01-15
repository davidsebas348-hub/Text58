--== Roblox Raw Script: Destruir automáticamente 1,2,3 y OUCH ==--

local Workspace = game:GetService("Workspace")

-- 1. Destruir Barry
local function destruirBarry(obj)
    if obj:IsA("Model") and obj.Name == "Barry" then
        obj:Destroy()
        print("Barry destruido ✅")
    end
end

-- 2. Destruir wall específico (hijo directo de Door)
local function destruirWall(obj)
    if obj:IsA("MeshPart") and obj.Name == "wall" and obj.Parent and obj.Parent.Name == "Door" then
        obj:Destroy()
        print("Wall específico destruido ✅")
    end
end

-- 3. Destruir Door dentro de M_Chef_Door
local function destruirDoor(obj)
    if obj:IsA("MeshPart") and obj.Name == "Door" and obj.Parent and obj.Parent.Name == "M_Chef_Door" then
        obj:Destroy()
        print("Door destruido ✅")
    end
end

-- 4. Destruir OUCH (Part dentro de Boulder)
local function destruirOUCH(obj)
    if obj:IsA("Part") and obj.Name == "OUCH" and obj.Parent and obj.Parent.Name == "Boulder" then
        obj:Destroy()
        print("OUCH destruido ✅")
    end
end

-- Función que revisa un objeto y aplica todas las reglas
local function revisarObjeto(obj)
    destruirBarry(obj)
    destruirWall(obj)
    destruirDoor(obj)
    destruirOUCH(obj)
end

-- Revisar todo el Workspace al inicio
for _, obj in pairs(Workspace:GetDescendants()) do
    revisarObjeto(obj)
end

-- Detectar nuevos objetos que aparezcan en Workspace
Workspace.DescendantAdded:Connect(function(obj)
    revisarObjeto(obj)
end)
