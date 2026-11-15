module rtlpp_06960 (
    input               clk,   
    input               rst_n, 
    input               ena,   
    input   [7:0]       Tsync, 
    input   [7:0]       Tgdel, 
    input   [15:0]      Tgate, 
    input   [15:0]      Tlen,  
    output  reg         sync,  
    output  reg         gate,  
    output  reg         done   
);

    reg     [15:0]      cnt, cnt_len;
    reg     [16:0]      cnt_nxt, cnt_len_nxt;
    reg                 cnt_done, cnt_len_done;

    reg     [4:0]       state;
    parameter           IDLE_S = 5'b00001;
    parameter           SYNC_S = 5'b00010;
    parameter           GDEL_S = 5'b00100;
    parameter           GATE_S = 5'b01000;
    parameter           LEN_S  = 5'b10000;

    always @(*) begin
        cnt_nxt      = {1'b0, cnt} - 1'b1;
        cnt_done     = cnt_nxt[16];

        cnt_len_nxt  = {1'b0, cnt_len} - 1'b1;
        cnt_len_done = cnt_len_nxt[16];
    end

    always @(posedge clk or negedge rst_n)
    begin
        if (!rst_n)
        begin
            state   <= IDLE_S;
            cnt     <= 16'h0;
            cnt_len <= 16'b0;
            sync    <= 1'b0;
            gate    <= 1'b0;
            done    <= 1'b0;
        end
        else if (ena)
        begin
            cnt     <= cnt_nxt[15:0];
            cnt_len <= cnt_len_nxt[15:0];
            done    <= 1'b0;

            case (state)
                IDLE_S:
                begin
                    state   <= SYNC_S;
                    cnt     <= Tsync;
                    cnt_len <= Tlen;

                    sync    <= 1'b1;
                end

                SYNC_S:
                begin
                    if (cnt_done)
                    begin
                        state <= GDEL_S;
                        cnt   <= Tgdel;

                        sync  <= 1'b0;
                    end
                end

                GDEL_S:
                begin
                    if (cnt_done)
                    begin
                        state <= GATE_S;
                        cnt   <= Tgate;

                        gate  <= 1'b1;
                    end
                end

                GATE_S:
                begin
                    if (cnt_done)
                    begin
                        state <= LEN_S;

                        gate  <= 1'b0;
                    end
                end

                LEN_S:
                begin
                    if (cnt_len_done)
                    begin
                        state   <= SYNC_S;
                        cnt     <= Tsync;
                        cnt_len <= Tlen;

                        sync    <= 1'b1;
                        done    <= 1'b1;
                    end
                end
            endcase
        end
    end
endmodule