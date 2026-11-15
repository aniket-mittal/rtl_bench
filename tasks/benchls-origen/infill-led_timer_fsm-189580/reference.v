module origen_189580 (
    input Sensor_Sync,
    input WR,
    input Prog_Sync,
    input Reset_Sync,
    input expired,
    input clk,
    output reg WR_Reset,
    output reg [6:0] LEDs,
    output reg [1:0] interval,
    output reg start_timer
);

    localparam tb = 2'b00;
    localparam te = 2'b01;
    localparam ty = 2'b10;
    localparam tbx2 = 2'b11;

    localparam A = 7'b0000001;
    localparam B = 7'b0000010;
    localparam C = 7'b0000100;
    localparam D = 7'b0001000;
    localparam E = 7'b0010000;

    reg [1:0] state;
    reg deviate;
    reg senseOneTime;

    always @(posedge clk) begin
        if (Reset_Sync || Prog_Sync) begin
            LEDs <= A;
            interval <= tbx2;
            WR_Reset <= 1'b0;
            start_timer <= 1'b1;
            senseOneTime <= 1'b1;
            state <= tb;
            deviate <= 1'b0;
        end
        else begin
            if (expired) begin
                case (state)
                    tb: begin
                        if (deviate) begin
                            if (Sensor_Sync && senseOneTime) begin
                                LEDs <= B;
                                interval <= te;
                            end
                            else begin
                                state <= B;
                            end
                        end
                        else begin
                            state <= B;
                        end
                    end
                    B: begin
                        if (WR) begin
                            state <= E;
                        end
                        else begin
                            state <= C;
                        end
                    end
                    C: begin
                        if (Sensor_Sync && senseOneTime) begin
                            LEDs <= D;
                            interval <= tbx2;
                        end
                        else begin
                            state <= D;
                        end
                    end
                    D: begin
                        state <= A;
                        deviate <= 1'b1;
                        senseOneTime <= 1'b1;
                    end
                    E: begin
                        state <= C;
                        interval <= ty;
                        WR_Reset <= 1'b0;
                    end
                    default: begin
                        state <= A;
                        deviate <= 1'b1;
                        start_timer <= 1'b1;
                    end
                endcase
            end
        end
    end

endmodule