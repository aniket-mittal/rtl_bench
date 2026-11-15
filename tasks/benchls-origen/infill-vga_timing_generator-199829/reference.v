module origen_199829 #(
    parameter front = 16,
    parameter visible_area = 640,
    parameter sync = 96,
    parameter back = 48
) (
    input ck,
    input reset,
    output reg [11:0] position,
    output reg newline,
    output reg syncron,
    output reg active
);

    reg [11:0] count;

    always @(posedge ck or negedge reset) begin
        if (!reset) begin
            count <= 0;
            syncron <= 1;
            active <= 0;
            position <= 0;
            newline <= 0;
        end else begin
            count <= count + 1;

            if (count < visible_area) begin
                position <= count;
                active <= 1;
                syncron <= 1;
            end else if (count < visible_area + front) begin
                active <= 0;
                syncron <= 1;
                position <= 0;
            end else if (count < visible_area + front + sync) begin
                active <= 0;
                syncron <= 1;
                position <= 0;
            end else if (count < visible_area + front + sync + back) begin
                active <= 0;
                syncron <= 0;
                position <= 0;
            end else begin
                count <= 0;
                syncron <= 1;
                active <= 0;
                position <= 0;
                newline <= 1;
            end
        end
    end

endmodule