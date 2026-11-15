module origen_116372(
    input wire clock,
    input wire A,
    input wire [3:0] keys,
    input wire [2:0] inputState,
    output reg [5:0] mem6x6,
    output reg [1:0] level
);

    reg [3:0] keys1, keys2;
    reg pressOnce;
    reg [5:0] currentMem, nextMem;

    always @(posedge clock) begin
        keys1 <= keys;
        keys2 <= keys1;
        
        if (inputState == 2'b10) begin
            if (keys1 != keys2 && !pressOnce) begin
                pressOnce <= 1'b1;
                case (keys1)
                    4'b0001: nextMem <= (currentMem < 6) ? currentMem : currentMem - 6;
                    4'b0010: nextMem <= (currentMem > 29) ? currentMem : currentMem + 6;
                    4'b0100: nextMem <= (currentMem % 6 == 0) ? currentMem : currentMem - 1;
                    4'b1000: nextMem <= (currentMem % 6 == 5) ? currentMem : currentMem + 1;
                    default: nextMem <= currentMem;
                endcase
            end
            else if (keys1 == 4'b0000) begin
                pressOnce <= 1'b0;
                currentMem <= nextMem;
            end
            mem6x6 <= currentMem;
        end
        else if (inputState == 2'b01) begin
            if (keys1 != keys2 && !pressOnce && A) begin
                pressOnce <= 1'b1;
                case (keys1)
                    4'b0001: level <= (level == 2'b11) ? level : level + 1;
                    4'b0010: level <= (level == 2'b00) ? level : level - 1;
                    default: level <= level;
                endcase
            end
            else if (keys1 == 4'b0000) begin
                pressOnce <= 1'b0;
            end
        end
        else begin
            mem6x6 <= 6'b000000;
            level <= 2'b01;
        end
    end

endmodule