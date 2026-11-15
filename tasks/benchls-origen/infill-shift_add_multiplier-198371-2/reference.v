module origen_198371 #(
    parameter N = 8,
    parameter M = 8
)(
    input clk,
    input reset,
    input mul,
    input [N-1:0] x,
    input [M-1:0] y,
    output reg [N+M-1:0] z_pos,
    output reg done
);

reg [7:0] counter;
reg shift;
reg si;
reg load;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        z_pos <= 0;
        counter <= 0;
        done <= 0;
        load <= 1;
    end
    else begin
        if (counter >= N) begin
            done <= 1;
        end
        if (load) begin
            z_pos[N-1:0] <= x;
            load <= 0;
        end
        if (mul && !done) begin
            if (z_pos[0]) begin
                {si, z_pos[N+M-1:1]} <= z_pos[N+M-1:0] + y;
                shift <= 1;
            end
            else begin
                si <= 0;
                shift <= 1;
            end
            if (shift) begin
                z_pos <= {si, z_pos[N+M-1:1]};
                counter <= counter + 1;
                shift <= 0;
            end
        end
    end
end

endmodule