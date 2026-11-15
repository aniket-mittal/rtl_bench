module origen_106492 (
    input wire clk,
    input wire rst,
    input wire we,
    input wire re,
    input wire [15:0] din,
    output reg [15:0] dout,
    output reg flagf,
    output reg flage
);

    reg [15:0] ram [0:15];
    reg [3:0] wp, rp;
    reg [4:0] count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            wp <= 4'b1111;
            rp <= 4'b1111;
            count <= 5'd0;
            flagf <= 1'b0;
            flage <= 1'b1;
            dout <= 16'bx;
        end else begin
            if (we && !flagf) begin
                wp <= wp + 1;
                ram[wp] <= din;
                if (!re || count != 5'd0)
                    count <= count + 1;
            end

            if (re && !flage) begin
                rp <= rp + 1;
                dout <= ram[rp];
                if (!we || count != 5'd16)
                    count <= count - 1;
            end

            if (we && !re && count == 5'd15)
                flagf <= 1'b1;
            else if (!we && re && count == 5'd1)
                flage <= 1'b1;
            else begin
                flagf <= (count == 5'd16);
                flage <= (count == 5'd0);
            end

            if (!(re || we))
                dout <= 16'bx;
            else if (!re && we)
                dout <= 16'bx;
        end
    end

endmodule