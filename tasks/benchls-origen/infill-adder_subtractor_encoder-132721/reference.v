module origen_132721(
    input [3:0] A,
    input [3:0] B,
    input select,
    output reg [1:0] Y1,
    output reg Y2
);

    reg [3:0] result;
    wire [3:0] sum, difference;

    // 4-bit adder
    assign sum = A + B;

    // 4-bit subtractor
    assign difference = A - B;

    // Select between addition and subtraction
    always @(*) begin
        if (select)
            result = sum;
        else
            result = difference;
    end

    // Priority encoder
    always @(*) begin
        casex(result)
            4'b1xxx: begin
                Y1 = 2'b11;
                Y2 = 1'b1;
            end
            4'b01xx: begin
                Y1 = 2'b10;
                Y2 = 1'b1;
            end
            4'b001x: begin
                Y1 = 2'b01;
                Y2 = 1'b1;
            end
            4'b0001: begin
                Y1 = 2'b00;
                Y2 = 1'b1;
            end
            4'b0000: begin
                Y1 = 2'b00;
                Y2 = 1'b0;
            end
            default: begin
                Y1 = 2'b00;
                Y2 = 1'b0;
            end
        endcase
    end

endmodule