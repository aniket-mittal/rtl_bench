module origen_053174(
    input wire [3:0] D,
    input wire [3:0] d,
    input wire start,
    input wire rst,
    input wire clk,
    output reg [3:0] q,
    output reg [3:0] r,
    output reg done
);

reg [7:0] RD;
reg [3:0] dd;
reg qq;
reg [4:0] counter;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        RD <= 8'b0;
        dd <= 4'b0;
        qq <= 1'b0;
        counter <= 5'b0;
        done <= 1'b0;
        q <= 4'b0;
        r <= 4'b0;
    end else begin
        if (start) begin
            RD <= {4'b0, D};
            dd <= d;
            counter <= 5'b0;
            done <= 1'b0;
        end else if (!done) begin
            if (RD[7:4] >= dd) begin
                RD[7:4] <= RD[7:4] - dd;
                qq <= 1'b1;
            end else begin
                qq <= 1'b0;
            end
            RD <= {RD[6:0], qq};
            counter <= counter + 1;
            
            if (counter == 4) begin
                q <= RD[3:0];
                r <= RD[7:4];
                done <= 1'b1;
            end
        end
    end
end

endmodule