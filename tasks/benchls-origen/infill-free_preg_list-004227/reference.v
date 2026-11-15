module origen_004227 (
    input wire clk,
    input wire rst,
    input wire dispatch_en_i,
    input wire retire_en_i,
    input wire [5:0] retire_preg_i,
    input wire recover_en_i,
    input wire [4:0] recover_head_i,
    output reg free_preg_vld_o,
    output reg [5:0] free_preg_o,
    output reg [4:0] free_preg_cur_head_o
);

    reg [5:0] FL [31:0];
    reg [4:0] head, tail;
    reg [5:0] count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            head <= 5'd0;
            tail <= 5'd0;
            count <= 6'd32;
            free_preg_vld_o <= 1'b1;
            free_preg_o <= 6'd32;
            free_preg_cur_head_o <= 5'd0;
            for (int i = 0; i < 32; i++) begin
                FL[i] <= i + 32;
            end
        end else begin
            if (recover_en_i) begin
                head <= recover_head_i;
                count <= 6'd32 - (recover_head_i - tail);
            end else begin
                if (dispatch_en_i && count > 0) begin
                    head <= head + 1;
                    count <= count - 1;
                end
                if (retire_en_i && count < 32) begin
                    FL[tail] <= retire_preg_i;
                    tail <= tail + 1;
                    count <= count + 1;
                end
            end

            free_preg_vld_o <= (count > 0);
            free_preg_o <= (dispatch_en_i && count > 0) ? FL[head] :
                           (retire_en_i && count < 32) ? retire_preg_i : free_preg_o;
            free_preg_cur_head_o <= head;
        end
    end

endmodule