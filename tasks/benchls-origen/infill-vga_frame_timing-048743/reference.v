module origen_048743 (
    input wire clkv,
    input wire clrv,
    output reg vr,
    output reg vrs,
    output reg vrsp,
    output reg vrspq,
    output reg [9:0] cntrv
);

    always @(posedge clkv or posedge clrv) begin
        if (clrv) begin
            cntrv <= 10'd0;
            vr <= 1'b0;
            vrs <= 1'b0;
            vrsp <= 1'b0;
            vrspq <= 1'b0;
        end else begin
            if (cntrv == 10'd524) begin
                cntrv <= 10'd0;
            end else begin
                cntrv <= cntrv + 1'b1;
            end

            case (cntrv)
                10'd32: begin
                    vrs <= 1'b0;
                    vrsp <= 1'b0;
                    vr <= 1'b0;
                    vrspq <= 1'b1;
                end
                10'd512: begin
                    vr <= 1'b1;
                    vrspq <= 1'b0;
                end
                10'd522: begin
                    vrs <= 1'b1;
                end
                10'd524: begin
                    vrs <= 1'b0;
                    vrsp <= 1'b1;
                end
                default: begin
                    // No change in output signals
                end
            endcase
        end
    end

endmodule