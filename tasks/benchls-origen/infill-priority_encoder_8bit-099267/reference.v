module origen_099267(
    input [7:0] a,
    output reg [2:0] y,
    output reg NONE
);

always @(*) begin
    casez(a)
        8'b00000000: begin
            y = 3'b000;
            NONE = 1'b1;
        end
        8'b???????1: begin
            y = 3'b000;
            NONE = 1'b0;
        end
        8'b??????10: begin
            y = 3'b001;
            NONE = 1'b0;
        end
        8'b?????100: begin
            y = 3'b010;
            NONE = 1'b0;
        end
        8'b????1000: begin
            y = 3'b011;
            NONE = 1'b0;
        end
        8'b???10000: begin
            y = 3'b100;
            NONE = 1'b0;
        end
        8'b??100000: begin
            y = 3'b101;
            NONE = 1'b0;
        end
        8'b?1000000: begin
            y = 3'b110;
            NONE = 1'b0;
        end
        8'b1???????: begin
            y = 3'b111;
            NONE = 1'b0;
        end
        default: begin
            y = 3'b000;
            NONE = 1'b1;
        end
    endcase
end

endmodule