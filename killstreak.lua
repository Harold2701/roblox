local Players = game:GetService("Players")
local remote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Hit")

_G.ok = true

local function findTarget()
    local found
    local dist = 9e9

    for i,v in pairs(Players:GetPlayers()) do
        if not v.Character then continue end
        local root = v.Character:FindFirstChild("HumanoidRootPart")
        if not root then continue end
        local d = (root.Position - Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude

        if d < dist then
            dist = d
            found = v
        end
    end

    return found
end

while wait() and _G.ok do
    local target = findTarget()
    local root = Players.LocalPlayer.Character.HumanoidRootPart
    local _,_, normal = workspace:FindPartOnRayWithWhitelist(Ray.new(root.Position, CFrame.new(root.Position, target.Character.HumanoidRootPart.Position).LookVector * 9e9), {root, target.Character}) 

    remote:FireServer(target, normal)
end
    
