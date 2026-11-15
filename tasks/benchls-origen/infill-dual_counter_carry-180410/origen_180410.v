module origen_180410 (
    input RESET,
    input CLK,
    input PAUSE,
    output reg CARRY6,
    output reg CARRY10
);

    reg [5:0] counter6;
    reg [9:0] counter10;

    [MASKED]

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