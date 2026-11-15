module origen_118428 (
    input wire clk,
    input wire rst,
    input wire read_cod_ena,
    input wire init_data_ena,
    input wire [3:0] spo_cod,
    output reg [3:0] nib_gene,
    output reg [4:0] addr_cod,
    output reg [23:0] data,
    output reg done_cod,
    output reg done_fin
);

    reg [2:0] cnt_array;
    integer i;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            nib_gene <= 4'b0;
            addr_cod <= 5'b0;
            done_cod <= 1'b0;
            done_fin <= 1'b0;
            cnt_array <= 3'd5;
            data <= 24'b0;
        end else begin
            if (init_data_ena) begin
                done_cod <= 1'b0;
                cnt_array <= 3'd5;
                data <= 24'b0;
                if (spo_cod == 4'hF) begin
                    done_fin <= 1'b1;
                end else begin
                    done_fin <= 1'b0;
                end
            end else if (read_cod_ena) begin
                if (cnt_array == 3'd5 || data[cnt_array*4+7 -: 4] != 4'hF) begin
                    data[cnt_array*4+3 -: 4] <= spo_cod;
                    addr_cod <= addr_cod + 5'd1;
                    cnt_array <= cnt_array - 3'd1;
                    if (spo_cod == 4'hF) begin
                        done_cod <= 1'b1;
                    end
                end
            end
        end
    end

    always @(*) begin
        nib_gene = data[3:0];
    end

endmodule