module origen_211422(
    input wire clk,
    input wire rst,
    input wire signed_div,
    input wire [31:0] div_opdata1,
    input wire [31:0] div_opdata2,
    input wire div_start,
    input wire div_cancel,
    output reg [63:0] div_res,
    output reg div_done
);

reg [32:0] div_temp;
reg [64:0] dividend;
reg [31:0] divisor;
reg [31:0] opdata1_tmp;
reg [31:0] opdata2_tmp;
reg [1:0] state;
reg [5:0] cnt;

localparam DivFree = 2'b00;
localparam DivZero = 2'b01;
localparam DivOn = 2'b10;
localparam DivEnd = 2'b11;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= DivFree;
        div_done <= 1'b0;
        div_res <= 64'b0;
    end
    else begin
        case (state)
            DivFree: begin
                if (div_start && !div_cancel) begin
                    if (div_opdata2 == 32'b0) begin
                        state <= DivZero;
                    end
                    else begin
                        if (signed_div) begin
                            opdata1_tmp <= (div_opdata1[31]) ? -div_opdata1 : div_opdata1;
                            opdata2_tmp <= (div_opdata2[31]) ? -div_opdata2 : div_opdata2;
                        end
                        else begin
                            opdata1_tmp <= div_opdata1;
                            opdata2_tmp <= div_opdata2;
                        end
                        dividend <= {1'b0, opdata1_tmp, 32'b0};
                        divisor <= opdata2_tmp;
                        cnt <= 6'b0;
                        state <= DivOn;
                    end
                end
                else begin
                    div_done <= 1'b0;
                end
            end
            DivZero: begin
                div_res <= 64'hFFFFFFFF_FFFFFFFF;
                div_done <= 1'b1;
                state <= DivFree;
            end
            DivOn: begin
                if (cnt < 6'd32) begin
                    div_temp <= {dividend[64:33], 1'b0};
                    if (dividend[64:33] >= divisor) begin
                        dividend <= {div_temp[31:0], dividend[31:0], 1'b1};
                    end
                    else begin
                        dividend <= {div_temp[31:0], dividend[31:0], 1'b0};
                    end
                    cnt <= cnt + 1'b1;
                end
                else begin
                    state <= DivEnd;
                end
            end
            DivEnd: begin
                if (signed_div && ((div_opdata1[31] ^ div_opdata2[31]) == 1'b1)) begin
                    div_res <= -{dividend[31:0], 32'b0};
                end
                else begin
                    div_res <= {dividend[31:0], 32'b0};
                end
                div_done <= 1'b1;
                if (!div_start) begin
                    state <= DivFree;
                    div_done <= 1'b0;
                end
            end
        endcase
    end
end

endmodule