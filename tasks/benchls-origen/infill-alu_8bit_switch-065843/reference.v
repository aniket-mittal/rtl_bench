module origen_065843(
    input [3:0] KEY,
    input [9:0] SW,
    output reg [9:0] LEDR
);

reg [4:0] later;

always @(*) begin
    LEDR[9:7] = KEY[2:0];
    
    case(KEY[2:0])
        3'b000: begin
            {LEDR[5], LEDR[4:0]} = SW[3:0] + SW[7:4];
            LEDR[6] = (LEDR[4:0] == 5'b00000);
        end
        
        3'b001: begin
            {LEDR[5], LEDR[4:0]} = SW[3:0] + (~SW[7:4] + 1'b1);
            LEDR[6] = (LEDR[4:0] == 5'b00000);
        end
        
        3'b010: begin
            LEDR[3:0] = ~SW[3:0];
            LEDR[6:4] = 3'b000;
        end
        
        3'b011: begin
            LEDR[3:0] = SW[3:0] & SW[7:4];
            LEDR[6:4] = 3'b000;
        end
        
        3'b100: begin
            LEDR[3:0] = SW[3:0] | SW[7:4];
            LEDR[6:4] = 3'b000;
        end
        
        3'b101: begin
            LEDR[3:0] = SW[3:0] ^ SW[7:4];
            LEDR[6:4] = 3'b000;
        end
        
        3'b110: begin
            later[0] = (SW[3] > SW[7]);
            later[1] = (SW[2] > SW[6]) & (SW[3] == SW[7]);
            later[2] = (SW[1] > SW[5]) & (SW[3:2] == SW[7:6]);
            later[3] = (SW[0] > SW[4]) & (SW[3:1] == SW[7:5]);
            later[4] = (SW[3:0] == SW[7:4]);
            LEDR[0] = |later;
            LEDR[6:1] = 6'b000000;
        end
        
        3'b111: begin
            LEDR[0] = (SW[3:0] == SW[7:4]);
            LEDR[6:1] = 6'b000000;
        end
    endcase
end

endmodule