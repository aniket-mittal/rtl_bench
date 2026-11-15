module origen_209125(
    input [2:0] Level,
    input password_auth,
    input [3:0] user_id, Password, RNG1, RNG2, PlayerTIn, PlayerUIn, FRndOrig, FRndEncryp, SRndEncryp, SRndOrig, SC_Tens_l2, SC_Units_l2, SC_Tens_l3, SC_Units_l3, index,
    output reg [3:0] NumOut1, NumOut2, NumOut3, NumOut4, NumOut5, NumOut6,
    output reg Encrypt_on1, Encrypt_on2, Encrypt_on3, Encrypt_on4, Encrypt_on5, Encrypt_on6
);

always @(*) begin
    if (password_auth == 0) begin
        // Password authentication failed
        NumOut1 = Password;
        NumOut2 = user_id;
        NumOut3 = 4'b1111;
        NumOut4 = 4'b1111;
        NumOut5 = 4'b1111;
        NumOut6 = 4'b1111;
        Encrypt_on1 = 0;
        Encrypt_on2 = 0;
        Encrypt_on3 = 1;
        Encrypt_on4 = 1;
        Encrypt_on5 = 1;
        Encrypt_on6 = 1;
    end else begin
        // Password authentication successful
        case (Level)
            3'd1: begin
                // Level 1
                NumOut1 = Password;
                NumOut2 = FRndOrig;
                NumOut3 = FRndEncryp;
                NumOut4 = 4'b1111;
                NumOut5 = 4'b1111;
                NumOut6 = 4'b1111;
                Encrypt_on1 = 0;
                Encrypt_on2 = 0;
                Encrypt_on3 = 1;
                Encrypt_on4 = 1;
                Encrypt_on5 = 1;
                Encrypt_on6 = 1;
            end
            3'd2: begin
                // Level 2
                NumOut1 = Password;
                NumOut2 = SRndOrig;
                NumOut3 = SRndEncryp;
                NumOut4 = 4'b1111;
                NumOut5 = SC_Tens_l2;
                NumOut6 = SC_Units_l2;
                Encrypt_on1 = 0;
                Encrypt_on2 = 0;
                Encrypt_on3 = 1;
                Encrypt_on4 = 1;
                Encrypt_on5 = 0;
                Encrypt_on6 = 0;
            end
            3'd3: begin
                // Level 3
                NumOut1 = RNG1;
                NumOut2 = RNG2;
                NumOut3 = PlayerTIn;
                NumOut4 = PlayerUIn;
                NumOut5 = SC_Tens_l3;
                NumOut6 = SC_Units_l3;
                Encrypt_on1 = 1;
                Encrypt_on2 = 1;
                Encrypt_on3 = 1;
                Encrypt_on4 = 1;
                Encrypt_on5 = 0;
                Encrypt_on6 = 0;
            end
            default: begin
                // Default case
                NumOut1 = 4'b0000;
                NumOut2 = 4'b0000;
                NumOut3 = 4'b0000;
                NumOut4 = 4'b0000;
                NumOut5 = 4'b0000;
                NumOut6 = 4'b0000;
                Encrypt_on1 = 0;
                Encrypt_on2 = 0;
                Encrypt_on3 = 0;
                Encrypt_on4 = 0;
                Encrypt_on5 = 0;
                Encrypt_on6 = 0;
            end
        endcase
    end
end

endmodule