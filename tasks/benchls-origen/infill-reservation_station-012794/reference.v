module origen_012794 (
    input wire clk,
    input wire new_inst,
    input wire p1, p2,
    input wire [63:0] src1, src2,
    input wire [3:0] vb_request,
    input wire [63:0] vb_data_in,
    input wire [8:0] vb_tag_in,
    input wire [63:0] res1, res2,
    input wire busy,
    input wire [3:0] wb_request,
    input wire kill,
    output reg [63:0] vb_data_out,
    output reg [8:0] vb_tag_out,
    output reg [63:0] op1, op2,
    output reg [63:0] wb_data,
    output reg [8:0] wb_tag,
    output reg nmi
);

    reg [63:0] operand1, operand2;
    reg [8:0] tag1, tag2;
    reg valid1, valid2;

    always @(posedge clk) begin
        if (kill) begin
            valid1 <= 0;
            valid2 <= 0;
            nmi <= 0;
        end else if (new_inst) begin
            operand1 <= src1;
            operand2 <= src2;
            valid1 <= p1;
            valid2 <= p2;
            tag1 <= p1 ? 9'b0 : vb_tag_in;
            tag2 <= p2 ? 9'b0 : vb_tag_in;
        end

        if (|vb_request) begin
            if (vb_request[0] && tag1 == vb_tag_in) begin
                operand1 <= vb_data_in;
                valid1 <= 1;
            end
            if (vb_request[1] && tag2 == vb_tag_in) begin
                operand2 <= vb_data_in;
                valid2 <= 1;
            end
        end

        if (|wb_request) begin
            if (wb_request[0] && tag1 == wb_tag) begin
                operand1 <= wb_data;
                valid1 <= 1;
            end
            if (wb_request[1] && tag2 == wb_tag) begin
                operand2 <= wb_data;
                valid2 <= 1;
            end
        end

        if (valid1 && valid2 && !busy) begin
            op1 <= operand1;
            op2 <= operand2;
        end

        vb_data_out <= res1;
        vb_tag_out <= tag1;
        wb_data <= res2;
        wb_tag <= tag2;

        nmi <= (valid1 && valid2 && !busy);
    end
endmodule

module completion_buffer (
    input wire clk,
    input wire kill,
    input wire fu_out,
    input wire [63:0] fu_output1, fu_output2,
    input wire [8:0] inst_tag,
    input wire bus_grant,
    output wire bus_request,
    output reg [3:0] bus_en,
    output reg [23:0] bus_tag,
    output reg [255:0] bus_data
);

    reg [3:0] bus_request_buf;
    reg [63:0] result_buffer [0:3];
    reg [8:0] tag_buffer [0:3];
    reg [3:0] valid_buffer;

    assign bus_request = bus_request_buf[0];

    always @(posedge clk) begin
        if (kill) begin
            bus_request_buf <= 4'b0;
            valid_buffer <= 4'b0;
        end else begin
            if (fu_out) begin
                result_buffer[0] <= fu_output1;
                result_buffer[1] <= fu_output2;
                tag_buffer[0] <= inst_tag;
                tag_buffer[1] <= inst_tag + 1;
                valid_buffer[1:0] <= 2'b11;
                bus_request_buf[1:0] <= 2'b11;
            end

            if (bus_grant) begin
                bus_en <= 4'b1111;
                bus_tag <= {tag_buffer[3], tag_buffer[2], tag_buffer[1], tag_buffer[0]};
                bus_data <= {result_buffer[3], result_buffer[2], result_buffer[1], result_buffer[0]};
                valid_buffer <= valid_buffer >> 1;
                bus_request_buf <= bus_request_buf >> 1;
            end else begin
                bus_en <= 4'b0000;
            end
        end
    end
endmodule