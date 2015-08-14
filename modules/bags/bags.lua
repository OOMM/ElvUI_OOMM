local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local B = E:GetModule('Bags');

function B:PositionBagFrames()

	if self.BagFrame then
		self.BagFrame:ClearAllPoints()
		self.BagFrame:Point('BOTTOMRIGHT', UIParent, 'BOTTOMRIGHT', -8, 8);
  else
  

	end
	
	if self.BankFrame then
		self.BankFrame:ClearAllPoints()
		if E.db.datatexts.leftChatPanel then
			self.BankFrame:SetPoint('CENTER');
		else
			self.BankFrame:SetPoint('CENTER');
		end		
	end
end


  