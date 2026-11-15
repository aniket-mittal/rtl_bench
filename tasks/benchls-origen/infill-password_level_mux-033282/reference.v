module origen_033282(
    input [2:0] Level,
    input password_auth,
    input [3:0] user_id, Password, RNG1, RNG2, PlayerTIn, PlayerUIn,
    input [3:0] FRndOrig, FRndEncryp, SRndEncryp, SRndOrig,
    input [3:0] SC_Tens_l2, SC_Units_l2, SC_Tens_l3, SC_Units_l3, index,
    output reg [3:0] NumOut1, NumOut2, NumOut3, NumOut4, NumOut5, NumOut6,
    output reg Encrypt_on1, Encrypt_on2, Encrypt_on3, Encrypt_on4, Encrypt_on5, Encrypt_on6
);

    always @(*) begin
        if (!password_auth) begin
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
            case (Level)
                3'b001: begin // Level 1
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
                3'b010: begin // Level 2
                    NumOut1 = Password;
                    NumOut2 = SRndOrig;
                    NumOut3 = SRndEncryp;
                    NumOut4 = SC_Tens_l2;
                    NumOut5 = SC_Units_l2;
                    NumOut6 = 4'b1111;
                    
                    Encrypt_on1 = 0;
                    Encrypt_on2 = 0;
                    Encrypt_on3 = 1;
                    Encrypt_on4 = 0;
                    Encrypt_on5 = 0;
                    Encrypt_on6 = 1;
                end
                3'b011: begin // Level 3
                    NumOut1 = RNG1;
                    NumOut2 = RNG2;
                    NumOut3 = PlayerTIn;
                    NumOut4 = PlayerUIn;
                    NumOut5 = SC_Tens_l3;
                    NumOut6 = SC_Units_l3;
                    
                    Encrypt_on1 = 0;
                    Encrypt_on2 = 0;
                    Encrypt_on3 = 0;
                    Encrypt_on4 = 0;
                    Encrypt_on5 = 0;
                    Encrypt_on6 = 0;
                end
                3'b100: begin // Level 4
                    NumOut1 = index;
                    NumOut2 = SC_Tens_l2;
                    NumOut3 = SC_Units_l2;
                    NumOut4 = SC_Tens_l3;
                    NumOut5 = SC_Units_l3;
                    NumOut6 = 4'b1111;
                    
                    Encrypt_on1 = 0;
                    Encrypt_on2 = 0;
                    Encrypt_on3 = 0;
                    Encrypt_on4 = 0;
                    Encrypt_on5 = 0;
                    Encrypt_on6 = 1;
                end
                default: begin // Invalid level
                    NumOut1 = Password;
                    NumOut2 = 4'b1111;
                    NumOut3 = 4'b1111;
                    NumOut4 = 4'b1111;
                    NumOut5 = 4'b1111;
                    NumOut6 = 4'b1111;
                    
                    Encrypt_on1 = 0;
                    Encrypt_on2 = 1;
                    Encrypt_on3 = 1;
                    Encrypt_on4 = 1;
                    Encrypt_on5 = 1;
                    Encrypt_on6 = 1;
                end
            endcase
        end
    end

endmodule