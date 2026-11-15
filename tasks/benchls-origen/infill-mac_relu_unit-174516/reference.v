module origen_174516 #(
    parameter IMG_Width = 8,
    parameter IMG_Height = 8,
    parameter Datawidth = 8,
    parameter ReLU = 1
)(
    input [Datawidth-1:0] In,
    input CLK,
    input CLR,
    input Valid_IN,
    input [Datawidth-1:0] K,
    output reg Valid_OUT,
    output reg [Datawidth-1:0] Out
);

reg [Datawidth-1:0] hang, cot;
reg [Datawidth*2-1:0] R0;
reg [Datawidth*2-1:0] result;
reg [Datawidth-1:0] _result;

always @(posedge CLK or posedge CLR) begin
    if (CLR) begin
        hang <= 0;
        cot <= 0;
        Valid_OUT <= 0;
        Out <= 0;
        R0 <= 0;
        result <= 0;
        _result <= 0;
    end
    else begin
        if (Valid_IN) begin
            hang <= In;
            cot <= K;
            R0 <= hang * cot;
            result <= R0;
            if (ReLU) begin
                _result <= (result[Datawidth*2-1]) ? 0 : result[Datawidth-1:0];
            end
            else begin
                _result <= result[Datawidth-1:0];
            end
            Valid_OUT <= 1;
            Out <= _result;
        end
        else begin
            Valid_OUT <= 0;
        end
    end
end

endmodule