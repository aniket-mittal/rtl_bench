module origen_144098 (
    input wire datain_h,
    input wire datain_l,
    input wire outclock,
    input wire outclocken,
    input wire aset,
    input wire aclr,
    input wire sset,
    input wire sclr,
    input wire oe,
    output reg dataout,
    output reg oe_out
);

    reg data_reg;

    always @(posedge outclock or posedge aset or posedge aclr) begin
        if (aset) begin
            data_reg <= 1'b1;
        end else if (aclr) begin
            data_reg <= 1'b0;
        end else if (outclocken) begin
            if (sset) begin
                data_reg <= 1'b1;
            end else if (sclr) begin
                data_reg <= 1'b0;
            end else begin
                data_reg <= datain_h ? datain_h : datain_l;
            end
        end
    end

    always @(posedge outclock or posedge aset or posedge aclr) begin
        if (aset) begin
            dataout <= 1'b1;
        end else if (aclr) begin
            dataout <= 1'b0;
        end else if (outclocken) begin
            dataout <= data_reg;
        end
    end

    always @(posedge outclock or posedge aset or posedge aclr) begin
        if (aset) begin
            oe_out <= 1'b1;
        end else if (aclr) begin
            oe_out <= 1'b0;
        end else if (outclocken) begin
            oe_out <= oe;
        end
    end

endmodule