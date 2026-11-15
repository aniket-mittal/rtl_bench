module origen_087699 (
    input wire clk_sys,
    input wire reset,
    input wire [1:0] addr,
    input wire we_n,
    input wire [7:0] idata,
    output reg [7:0] odata,
    input wire [7:0] ipa, ipb, ipc,
    output wire [7:0] opa, opb, opc
);

    reg [7:0] mode;
    reg [7:0] opa_r, opb_r, opc_r;

    always @(posedge clk_sys or posedge reset) begin
        if (reset) begin
            mode <= 8'hFF;
            opa_r <= 8'h00;
            opb_r <= 8'h00;
            opc_r <= 8'h00;
        end else if (!we_n) begin
            case (addr)
                2'b00: opa_r <= idata;
                2'b01: opb_r <= idata;
                2'b10: opc_r <= idata;
                2'b11: begin
                    if (idata[7]) begin
                        mode <= idata;
                        opa_r <= 8'h00;
                        opb_r <= 8'h00;
                        opc_r <= 8'h00;
                    end else begin
                        opc_r[idata[3:1]] <= idata[0];
                    end
                end
            endcase
        end
    end

    assign opa = mode[4] ? 8'hFF : opa_r;
    assign opb = mode[1] ? 8'hFF : opb_r;
    assign opc = {mode[3] ? 4'hF : opc_r[7:4], mode[0] ? 4'hF : opc_r[3:0]};

    always @(*) begin
        case (addr)
            2'b00: odata = mode[4] ? ipa : opa_r;
            2'b01: odata = mode[1] ? ipb : opb_r;
            2'b10: odata = {mode[3] ? ipc[7:4] : opc_r[7:4], mode[0] ? ipc[3:0] : opc_r[3:0]};
            2'b11: odata = mode;
        endcase
    end

endmodule