module origen_184218(
    input clk,
    input rst_n,
    input [7:0] datain,
    input readyb0,
    output reg [15:0] combbyte,
    output reg [6:0] addrb0,
    output reg finishb0
);

reg [1:0] statecounter;
reg [7:0] lowbyte, highbyte;
reg [15:0] combbyte_r;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        statecounter <= 2'b00;
        lowbyte <= 8'b0;
        highbyte <= 8'b0;
        combbyte <= 16'b0;
        addrb0 <= 7'b0;
        finishb0 <= 1'b0;
    end
    else begin
        if (readyb0 && statecounter == 2'b00) begin
            statecounter <= 2'b01;
        end
        else if (readyb0 && statecounter == 2'b01) begin
            statecounter <= 2'b10;
        end
        else if (readyb0 && statecounter == 2'b10) begin
            statecounter <= 2'b11;
        end
        else if (readyb0 && statecounter == 2'b11) begin
            statecounter <= 2'b00;
        end

        if (statecounter == 2'b10) begin
            highbyte <= datain;
        end
        else if (statecounter == 2'b11) begin
            lowbyte <= datain;
        end

        if (statecounter == 2'b00) begin
            combbyte_r <= {highbyte, lowbyte};
            combbyte <= combbyte_r;
        end

        addrb0 <= statecounter;
        finishb0 <= (statecounter == 2'b10) ? 1'b1 : 1'b0;
    end
end

endmodule