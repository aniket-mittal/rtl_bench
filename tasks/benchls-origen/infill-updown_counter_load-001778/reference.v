module origen_001778 (
    input wire CP,
    input wire CLR,
    input wire LD,
    input wire M,
    input wire [3:0] D,
    output reg [3:0] Q,
    output reg Qcc
);

    reg [3:0] number;
    reg carry;

    always @(posedge CP or posedge CLR) begin
        if (CLR) begin
            number <= 4'b0000;
            carry <= 1'b1;
        end
        else if (!LD) begin
            number <= D;
            carry <= 1'b1;
        end
        else begin
            if (M) begin // Up-count
                if (number == 4'b1111) begin
                    number <= 4'b0000;
                    carry <= 1'b0;
                end
                else begin
                    number <= number + 1;
                    carry <= 1'b1;
                end
            end
            else begin // Down-count
                if (number == 4'b0000) begin
                    number <= 4'b1111;
                    carry <= 1'b0;
                end
                else begin
                    number <= number - 1;
                    carry <= 1'b1;
                end
            end
        end
    end

    always @(*) begin
        Q = number;
        Qcc = carry;
    end

endmodule