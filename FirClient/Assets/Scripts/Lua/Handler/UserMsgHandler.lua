local UserMsgHandler = class("UserMsgHandler")

function UserMsgHandler:Initialize()
    self.moduleMgr = MgrCenter:GetManager(ManagerNames.Module)
    self.userModule = self.moduleMgr:GetModule(ModuleNames.User)
end

function UserMsgHandler:OnRecvLogin(data)
    if type(data) ~= 'table' then return end
    if self.userModule then
        self.userModule:Res_UserLogin(data)
    end
end

function UserMsgHandler:OnRecvRegister(data)
    if type(data) ~= 'table' then return end
    if self.userModule then
        self.userModule:Res_UserRegister(data)
    end
end

UserMsgHandler.MsgFuncs = 
{
    ["pb_user.Res_Login"] = UserMsgHandler.OnRecvLogin,
    ["pb_user.Res_Register"] = UserMsgHandler.OnRecvLogin,
}

return UserMsgHandler