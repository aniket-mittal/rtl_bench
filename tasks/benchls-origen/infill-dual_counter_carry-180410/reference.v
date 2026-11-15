module origen_180410 (
    input RESET,
    input CLK,
    input PAUSE,
    output reg CARRY6,
    output reg CARRY10
);

    reg [5:0] counter6;
    reg [9:0] counter10;

    always @(posedge CLK) begin
        if (RESET) begin
            counter6 <= 6'b0;
            CARRY6 <= 1'b0;
        end
        else if (PAUSE) begin
            counter6 <= counter6;
        end
        else begin
            counter6 <= counter6 + 1'b1;
            if (counter6 == 6'b101000) begin
                counter6 <= 6'b0;
                CARRY6 <= 1'b1;
            end
            else begin
                CARRY6 <= 1'b0;
            end
        end
    end

    always @(posedge CLK) begin
        if (RESET) begin
            counter10 <= 10'b0;
            CARRY10 <= 1'b0;
        end
        else if (PAUSE) begin
            counter10 <= counter10;
        end
        else begin
            counter10 <= counter10 + 1'b1;
            if (counter10 == 10'b1001000000) begin
                counter10 <= 10'b0;
                CARRY10 <= 1'b1;
            end
            else begin
                CARRY10 <= 1'b0;
            end
        end
    end

endmodule