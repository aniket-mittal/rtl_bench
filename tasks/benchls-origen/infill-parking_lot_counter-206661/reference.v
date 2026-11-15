module origen_206661(
    input clk,
    input rst,
    input in1,
    input in2,
    output reg status1,
    output reg status2
);

parameter EntryOpen = 2'b00;
parameter EntryClosed = 2'b01;
parameter ExitOpen = 2'b10;
parameter ExitClosed = 2'b11;

reg [1:0] Entry_curr, Entry_next;
reg [1:0] Exit_curr, Exit_next;
reg [5:0] capacity;

always @(posedge clk, posedge rst) begin
    if (rst) begin
        Entry_curr <= EntryClosed;
        Exit_curr <= ExitClosed;
        capacity <= 0;
    end
    else begin
        Entry_curr <= Entry_next;
        Exit_curr <= Exit_next;
        if (in1) begin
            if (capacity < 50) begin
                Entry_next <= EntryOpen;
                capacity <= capacity + 1;
            end
            else begin
                Entry_next <= EntryClosed;
            end
        end
        if (in2) begin
            Exit_next <= ExitOpen;
            capacity <= capacity - 1;
        end
    end
end

always @* begin
    case (Entry_curr)
        EntryOpen: status1 = 1;
        EntryClosed: status1 = 0;
    endcase

    case (Exit_curr)
        ExitOpen: status2 = 1;
        ExitClosed: status2 = 0;
    endcase
end

endmodule