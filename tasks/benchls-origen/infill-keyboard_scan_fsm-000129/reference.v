module origen_000129(
    input wire clock,
    input wire k_tr,
    output reg [7:0] key_code
);

    reg [2:0] st;
    reg [5:0] step;
    reg [7:0] TT;
    reg [15:0] tmp;
    reg [15:0] tmpa;

    parameter step_r = 42;

    always @(posedge clock) begin
        if (k_tr) begin
            st <= 0;
            step <= 0;
            tmp <= 0;
        end else begin
            case (st)
                0: st <= 1;
                1: begin
                    if (step > step_r) begin
                        st <= 4;
                    end else begin
                        st <= 2;
                        tmp <= 0;
                        case (step)
                            0: TT <= 8'h11;
                            1: TT <= 8'h21;
                            2: TT <= 8'h31;
                            3: TT <= 8'h41;
                            4: TT <= 8'h51;
                            5: TT <= 8'h61;
                            6: TT <= 8'h71;
                            7: TT <= 8'h12;
                            8: TT <= 8'h22;
                            9: TT <= 8'h32;
                            10: TT <= 8'h42;
                            11: TT <= 8'h52;
                            12: TT <= 8'h62;
                            13: TT <= 8'h72;
                            14: TT <= 8'h13;
                            15: TT <= 8'h23;
                            16: TT <= 8'h33;
                            17: TT <= 8'h43;
                            18: TT <= 8'h53;
                            19: TT <= 8'h63;
                            20: TT <= 8'h73;
                            21: TT <= 8'h14;
                            22: TT <= 8'h24;
                            23: TT <= 8'h34;
                            24: TT <= 8'h44;
                            25: TT <= 8'h54;
                            26: TT <= 8'h64;
                            27: TT <= 8'h74;
                            28: TT <= 8'h15;
                            29: TT <= 8'h25;
                            30: TT <= 8'h35;
                            31: TT <= 8'h45;
                            32: TT <= 8'h55;
                            33: TT <= 8'h65;
                            34: TT <= 8'h75;
                            35: TT <= 8'h16;
                            36: TT <= 8'h26;
                            37: TT <= 8'h36;
                            38: TT <= 8'h46;
                            39: TT <= 8'h56;
                            40: TT <= 8'h66;
                            41: TT <= 8'h76;
                            42: TT <= 8'h17;
                        endcase
                        tmpa <= {TT[7:4], 12'h000};
                    end
                end
                2: begin
                    if (tmp == tmpa) begin
                        st <= 3;
                        tmp <= 0;
                    end else begin
                        tmp <= tmp + 1;
                    end
                end
                3: begin
                    if (tmp == 16'h1000) begin
                        st <= 1;
                        step <= step + 1;
                    end else begin
                        tmp <= tmp + 1;
                    end
                end
                4: st <= 4;
            endcase
        end
    end

    always @(*) begin
        case (TT[3:0])
            4'h1: key_code = (tmp < tmpa) ? 8'h2B : 8'hF0;
            4'h2: key_code = (tmp < tmpa) ? 8'h34 : 8'hF0;
            4'h3: key_code = (tmp < tmpa) ? 8'h33 : 8'hF0;
            4'h4: key_code = (tmp < tmpa) ? 8'h3B : 8'hF0;
            4'h5: key_code = (tmp < tmpa) ? 8'h42 : 8'hF0;
            4'h6: key_code = (tmp < tmpa) ? 8'h4B : 8'hF0;
            4'h7: key_code = (tmp < tmpa) ? 8'h4C : 8'hF0;
            default: key_code = 8'hF0;
        endcase
    end

endmodule