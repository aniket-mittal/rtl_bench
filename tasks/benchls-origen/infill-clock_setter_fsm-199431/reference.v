module origen_199431(
    input mode, set, buzzer, rst,
    output ym0, ym1, yh0, yh1,
    output start
);

    reg [2:0] cs, ns;
    reg [3:0] dm0, dm1, dh0, dh1;

    localparam  statem0 = 3'b000,
                statem1 = 3'b001,
                stateh0 = 3'b010,
                stateh1 = 3'b011,
                state_start = 3'b100;

    always @(posedge mode or posedge rst) begin
        if (rst) begin
            cs <= statem0;
            dm0 <= 4'b0000;
            dm1 <= 4'b0000;
            dh0 <= 4'b0000;
            dh1 <= 4'b0000;
        end
        else begin
            cs <= ns;
            case (cs)
                statem0: begin
                    if (set) begin
                        dm0 <= dm0 + 1;
                        if (dm0 == 4'b1001) begin
                            dm0 <= 4'b0000;
                            dm1 <= dm1 + 1;
                            if (dm1 == 4'b0110) begin
                                dm1 <= 4'b0000;
                            end
                        end
                    end
                end
                statem1: begin
                    if (set) begin
                        dm1 <= dm1 + 1;
                        if (dm1 == 4'b0110) begin
                            dm1 <= 4'b0000;
                        end
                    end
                end
                stateh0: begin
                    if (set) begin
                        dh0 <= dh0 + 1;
                        if (dh0 == 4'b1001) begin
                            dh0 <= 4'b0000;
                            dh1 <= dh1 + 1;
                            if (dh1 == 4'b0010) begin
                                dh1 <= 4'b0000;
                            end
                        end
                    end
                end
                stateh1: begin
                    if (set) begin
                        dh1 <= dh1 + 1;
                        if (dh1 == 4'b0010) begin
                            dh1 <= 4'b0000;
                        end
                    end
                end
                state_start: begin
                    if (buzzer) begin
                        dm0 <= 4'b0000;
                        dm1 <= 4'b0000;
                        dh0 <= 4'b0000;
                        dh1 <= 4'b0000;
                    end
                end
            endcase
        end
    end

    always @(cs) begin
        case (cs)
            statem0: ns = statem1;
            statem1: ns = stateh0;
            stateh0: ns = stateh1;
            stateh1: ns = state_start;
            state_start: ns = statem0;
        endcase
    end

    assign ym0 = dm0;
    assign ym1 = dm1;
    assign yh0 = dh0;
    assign yh1 = dh1;
    assign start = (cs == state_start);

endmodule