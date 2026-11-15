module origen_007687(
    input wire clk,
    input wire rst,
    input wire signed_div_i,
    input wire [31:0] opdata1_i,
    input wire [31:0] opdata2_i,
    input wire start_i,
    input wire annul_i,
    output reg [63:0] result_o,
    output reg ready_o
);

    // FSM states
    localparam DivFree = 2'b00;
    localparam DivByZero = 2'b01;
    localparam DivOn = 2'b10;
    localparam DivEnd = 2'b11;

    reg [1:0] state;
    reg [5:0] cnt;
    reg [64:0] tempresult;
    reg [31:0] temp_op1, temp_op2;
    reg [31:0] dividend, divisor;
    reg invert_result;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= DivFree;
            ready_o <= 1'b0;
            result_o <= 64'b0;
        end else begin
            case (state)
                DivFree: begin
                    if (start_i && !annul_i) begin
                        if (opdata2_i == 32'b0) begin
                            state <= DivByZero;
                        end else begin
                            state <= DivOn;
                            cnt <= 6'b0;
                            if (signed_div_i && opdata1_i[31]) temp_op1 <= ~opdata1_i + 1;
                            else temp_op1 <= opdata1_i;
                            if (signed_div_i && opdata2_i[31]) temp_op2 <= ~opdata2_i + 1;
                            else temp_op2 <= opdata2_i;
                            dividend <= 32'b0;
                            divisor <= temp_op2;
                            tempresult <= {33'b0, temp_op1};
                            invert_result <= signed_div_i && (opdata1_i[31] ^ opdata2_i[31]);
                        end
                    end else begin
                        ready_o <= 1'b0;
                        result_o <= 64'b0;
                    end
                end
                DivByZero: begin
                    state <= DivEnd;
                    result_o <= {32'hffffffff, 32'hffffffff};
                end
                DivOn: begin
                    if (annul_i) begin
                        state <= DivFree;
                    end else if (cnt == 6'd32) begin
                        state <= DivEnd;
                        if (invert_result) begin
                            result_o[63:32] <= ~tempresult[64:33] + 1;
                            result_o[31:0] <= ~tempresult[31:0] + 1;
                        end else begin
                            result_o <= tempresult[63:0];
                        end
                    end else begin
                        cnt <= cnt + 1;
                        if (tempresult[64:33] >= divisor) begin
                            tempresult <= {tempresult[63:0], 1'b1};
                            tempresult[64:33] <= tempresult[64:33] - divisor;
                        end else begin
                            tempresult <= {tempresult[63:0], 1'b0};
                        end
                    end
                end
                DivEnd: begin
                    ready_o <= 1'b1;
                    if (!start_i) begin
                        state <= DivFree;
                        ready_o <= 1'b0;
                    end
                end
            endcase
        end
    end

endmodule