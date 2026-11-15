module origen_181285 (
    input tick,
    input [3:0] state,
    output reg buzz,
    output reg buzz_done
);

reg [3:0] count;
reg [3:0] stop;

always @(posedge tick) begin
    case (state)
        4'b0101: begin // State 5
            count <= count + 1;
            stop <= stop + 1;
            if (stop == 10) begin
                buzz <= 0;
                buzz_done <= 1;
            end
            if (count % 1 == 0 && !buzz_done) begin
                buzz <= ~buzz;
            end
        end
        4'b0110: begin // State 6
            count <= count + 1;
            stop <= stop + 1;
            if (stop == 12) begin
                buzz <= 0;
                buzz_done <= 1;
            end
            if (count % 3 == 0 && !buzz_done) begin
                buzz <= ~buzz;
            end
        end
        4'b0111: begin // State 7
            stop <= stop + 1;
            buzz <= 1;
            if (stop == 14) begin
                buzz <= 0;
                buzz_done <= 1;
            end
        end
        default: begin
            count <= 0;
            stop <= 0;
            buzz <= 0;
            buzz_done <= 0;
        end
    endcase
end

endmodule