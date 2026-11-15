module origen_016071 (
    input wire clk,
    input wire Dir,
    input wire StepEnable,
    input wire rst,
    input wire [3:0] speed,
    output reg [3:0] StepDrive
);

    reg [2:0] state;
    reg [15:0] StepCounter;
    reg [15:0] StepLockOut;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            StepDrive <= 4'b0000;
            state <= 3'b000;
            StepCounter <= 16'd0;
        end else begin
            StepCounter <= StepCounter + 1;

            case (speed)
                4'd0: StepLockOut <= 16'd65535;
                4'd1: StepLockOut <= 16'd32767;
                4'd2: StepLockOut <= 16'd16383;
                4'd3: StepLockOut <= 16'd8191;
                4'd4: StepLockOut <= 16'd4095;
                4'd5: StepLockOut <= 16'd2047;
                4'd6: StepLockOut <= 16'd1023;
                4'd7: StepLockOut <= 16'd511;
                4'd8: StepLockOut <= 16'd255;
                default: StepLockOut <= 16'd1023;
            endcase

            if (StepEnable && (StepCounter >= StepLockOut)) begin
                StepCounter <= 16'd0;
                if (Dir)
                    state <= state + 1;
                else
                    state <= state - 1;
            end

            case (state)
                3'b000: StepDrive <= 4'b1000;
                3'b001: StepDrive <= 4'b1100;
                3'b010: StepDrive <= 4'b0100;
                3'b011: StepDrive <= 4'b0110;
                3'b100: StepDrive <= 4'b0010;
                3'b101: StepDrive <= 4'b0011;
                3'b110: StepDrive <= 4'b0001;
                3'b111: StepDrive <= 4'b1001;
            endcase
        end
    end

endmodule