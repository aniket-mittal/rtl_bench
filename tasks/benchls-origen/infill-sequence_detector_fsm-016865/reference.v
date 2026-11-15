module origen_016865(
    input [1:0] num,
    input clk,
    output reg ans
);

    // State encoding
    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;

    reg [1:0] status, next_status;

    // State transition logic
    always @(*) begin
        case(status)
            S0: next_status = (num == 2'b01) ? S1 : S0;
            S1: begin
                case(num)
                    2'b01: next_status = S1;
                    2'b10: next_status = S2;
                    default: next_status = S0;
                endcase
            end
            S2: begin
                case(num)
                    2'b01: next_status = S1;
                    2'b10: next_status = S2;
                    2'b11: next_status = S3;
                    default: next_status = S0;
                endcase
            end
            S3: begin
                case(num)
                    2'b01: next_status = S1;
                    2'b11: next_status = S3;
                    default: next_status = S0;
                endcase
            end
            default: next_status = S0;
        endcase
    end

    // State register
    always @(posedge clk) begin
        status <= next_status;
    end

    // Output logic
    always @(*) begin
        ans = (status == S3);
    end

endmodule