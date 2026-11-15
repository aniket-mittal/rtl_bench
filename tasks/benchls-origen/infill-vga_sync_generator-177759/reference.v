module origen_177759(
    input [0:3] sw,
    input reset,
    input CLK,
    output [0:3] red,
    output [0:3] green,
    output [0:3] blue,
    output hsync,
    output vsync,
    output led
);

reg [10:0] hsyncCounter;
reg [9:0] vsyncCounter;
reg hNext, vNext;

always @(posedge CLK) begin
    if (reset) begin
        hsyncCounter <= 0;
        vsyncCounter <= 0;
        hNext <= 0;
        vNext <= 0;
    end
    else begin
        hsyncCounter <= hsyncCounter + 1;
        if (hsyncCounter == 800) begin
            hsyncCounter <= 0;
            hNext <= 1;
        end
        else begin
            hNext <= 0;
        end

        if (hNext) begin
            vsyncCounter <= vsyncCounter + 1;
            if (vsyncCounter == 525) begin
                vsyncCounter <= 0;
                vNext <= 1;
            end
            else begin
                vNext <= 0;
            end
        end
    end
end

assign hsync = (hsyncCounter <= 48) || (hsyncCounter >= 49 && hsyncCounter <= 688) || (hsyncCounter >= 689 && hsyncCounter <= 704);
assign vsync = (vsyncCounter <= 33) || (vsyncCounter >= 34 && vsyncCounter <= 513) || (vsyncCounter >= 514 && vsyncCounter <= 523);

assign red = (hsyncCounter >= 0 && hsyncCounter <= 639) ? 4'b1111 : 4'b0000;
assign green = (vsyncCounter >= 0 && vsyncCounter <= 479) ? 4'b1111 : 4'b0000;
assign blue = (hsyncCounter >= 0 && hsyncCounter <= 639 && vsyncCounter >= 0 && vsyncCounter <= 479) ? 4'b1111 : 4'b0000;

assign led = (hsyncCounter >= 0 && hsyncCounter <= 639 && vsyncCounter >= 0 && vsyncCounter <= 479) ? 1'b1 : 1'b0;

endmodule