module origen_205132 (
    input        sclk,
    input        rst_n,
    input        init_done,
    input        aref_en,
    output [3:0] aref_cmd,
    output [11:0] aref_addr,
    output       aref_req,
    output       aref_end
);

reg aref_flag;
reg [2:0] cnt_cmd;
reg [15:0] cnt_15ms;

always @(posedge sclk or negedge rst_n) begin
    if (!rst_n) begin
        aref_flag <= 1'b0;
        cnt_cmd <= 3'b0;
        cnt_15ms <= 16'b0;
    end
    else if (init_done) begin
        if (aref_en & ~aref_flag) begin
            aref_flag <= 1'b1;
            cnt_cmd <= 3'b001;
        end
        else if (aref_flag) begin
            if (cnt_cmd == 3'b111) begin
                aref_flag <= 1'b0;
                cnt_cmd <= 3'b0;
            end
            else begin
                cnt_cmd <= cnt_cmd + 3'b1;
            end

            if (cnt_15ms == 16'h3D09) begin
                cnt_15ms <= 16'b0;
            end
            else begin
                cnt_15ms <= cnt_15ms + 16'b1;
            end
        end
    end
end

assign aref_cmd = (cnt_cmd == 3'b001) ? 4'b0010 :  // PRE
                  (cnt_cmd == 3'b100) ? 4'b0001 :  // AREF
                  4'b0000;  // NOP

assign aref_addr = 12'b0;
assign aref_req = (cnt_15ms == 16'h3D09);
assign aref_end = (cnt_cmd == 3'b111);

endmodule