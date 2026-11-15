module origen_046838 (
    input wire CLK,
    input wire reset,
    input wire [11:0] operand,
    input wire [15:0] number,
    output reg wren,
    output reg ready,
    output reg [11:0] address,
    output reg [15:0] result,
    output reg [11:0] bsf
);

    reg [15:0] num1, num2;
    reg [11:0] counter;
    reg [1:0] stage;

    always @(posedge CLK or posedge reset) begin
        if (reset) begin
            wren <= 0;
            ready <= 0;
            address <= 0;
            result <= 0;
            bsf <= 0;
            num1 <= 0;
            num2 <= 1;
            counter <= 0;
            stage <= 0;
        end else begin
            if (operand <= bsf) begin
                if (operand == 0) begin
                    result <= 0;
                    ready <= 1;
                end else begin
                    address <= operand;
                    result <= number;
                    ready <= 1;
                end
            end else begin
                if (bsf < 1) begin
                    if (counter < operand) begin
                        counter <= counter + 1;
                        if (counter == 0) begin
                            result <= 0;
                        end else if (counter == 1) begin
                            result <= 1;
                        end else begin
                            result <= num1 + num2;
                            num1 <= num2;
                            num2 <= num1 + num2;
                        end
                        wren <= 1;
                        address <= counter;
                    end else begin
                        wren <= 0;
                        ready <= 1;
                        bsf <= operand;
                    end
                end else begin
                    case (stage)
                        0: begin
                            address <= bsf;
                            stage <= 1;
                        end
                        1: begin
                            num2 <= number;
                            address <= bsf - 1;
                            stage <= 2;
                        end
                        2: begin
                            num1 <= number;
                            counter <= bsf + 1;
                            stage <= 3;
                        end
                        3: begin
                            if (counter <= operand) begin
                                result <= num1 + num2;
                                num1 <= num2;
                                num2 <= num1 + num2;
                                wren <= 1;
                                address <= counter;
                                counter <= counter + 1;
                            end else begin
                                wren <= 0;
                                ready <= 1;
                                bsf <= operand;
                                stage <= 0;
                            end
                        end
                    endcase
                end
            end
        end
    end
endmodule