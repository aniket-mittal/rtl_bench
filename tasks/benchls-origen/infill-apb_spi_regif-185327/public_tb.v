// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_185327 dut (
    .aresetn(in_vec[23:23]),
    .sresetn(in_vec[22:22]),
    .psel(in_vec[21:21]),
    .penable(in_vec[20:20]),
    .pwrite(in_vec[19:19]),
    .paddr(in_vec[18:11]),
    .wr_data_in(in_vec[10:3]),
    .cfg_master(in_vec[2:2]),
    .rx_fifo_empty(in_vec[1:1]),
    .tx_fifo_empty(in_vec[0:0]),
    .tx_fifo_data(out_vec[10:3]),
    .tx_fifo_write(out_vec[2:2]),
    .tx_fifo_last(out_vec[1:1]),
    .rx_fifo_read(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'h66ab88;
    stim[1] = 24'h092ef4;
    stim[2] = 24'hf2137d;
    stim[3] = 24'hf0e20a;
    stim[4] = 24'hec48b2;
    stim[5] = 24'h850990;
    stim[6] = 24'h804679;
    stim[7] = 24'hfa9716;
    stim[8] = 24'h872a78;
    stim[9] = 24'hf53542;
    stim[10] = 24'h9fbe0f;
    stim[11] = 24'h89b601;
    stim[12] = 24'h8b20a8;
    stim[13] = 24'hfcfa39;
    stim[14] = 24'hca0820;
    stim[15] = 24'hd2fab6;
    stim[16] = 24'he53e4d;
    stim[17] = 24'hc87f97;
    stim[18] = 24'h90ed29;
    stim[19] = 24'hdb71d4;
    stim[20] = 24'ha04633;
    stim[21] = 24'h82510b;
    stim[22] = 24'h85e995;
    stim[23] = 24'hba7843;
    stim[24] = 24'hae98d1;
    stim[25] = 24'h4974c8;
    stim[26] = 24'hb31b46;
    stim[27] = 24'h97118c;
    stim[28] = 24'hb4235a;
    stim[29] = 24'hd18f1b;
    stim[30] = 24'hcdd5a6;
    stim[31] = 24'hab3641;
    stim[32] = 24'hf2e629;
    stim[33] = 24'hfa810e;
    stim[34] = 24'hfab2d2;
    stim[35] = 24'h808c8a;
    stim[36] = 24'h9646f7;
    stim[37] = 24'h9ca584;
    stim[38] = 24'hce0372;
    stim[39] = 24'h8133c4;
    stim[40] = 24'he9d44f;
    stim[41] = 24'hcfad33;
    stim[42] = 24'hf0ec03;
    stim[43] = 24'hfbc225;
    stim[44] = 24'hc7cca1;
    stim[45] = 24'h8d661b;
    stim[46] = 24'ha26df6;
    stim[47] = 24'h1c0a48;
    stim[48] = 24'he54a90;
    stim[49] = 24'hb9902d;
    stim[50] = 24'hd7750f;
    stim[51] = 24'hbe4dae;
    stim[52] = 24'h9d6871;
    stim[53] = 24'hdf9f4d;
    stim[54] = 24'hd5cf1d;
    stim[55] = 24'hf2dc46;
    stim[56] = 24'hd66a35;
    stim[57] = 24'h8d1269;
    stim[58] = 24'hcb7809;
    stim[59] = 24'h81ca1d;
    stim[60] = 24'ha3eab0;
    stim[61] = 24'hfff484;
    stim[62] = 24'h9a763d;
    stim[63] = 24'hc911da;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 11'h000;
      expv[1] = 11'h000;
      expv[2] = 11'h000;
      expv[3] = 11'h000;
      expv[4] = 11'h000;
      expv[5] = 11'h000;
      expv[6] = 11'h000;
      expv[7] = 11'h000;
      expv[8] = 11'h000;
      expv[9] = 11'h000;
      expv[10] = 11'h000;
      expv[11] = 11'h000;
      expv[12] = 11'h000;
      expv[13] = 11'h000;
      expv[14] = 11'h000;
      expv[15] = 11'h000;
      expv[16] = 11'h000;
      expv[17] = 11'h000;
      expv[18] = 11'h000;
      expv[19] = 11'h000;
      expv[20] = 11'h000;
      expv[21] = 11'h000;
      expv[22] = 11'h000;
      expv[23] = 11'h000;
      expv[24] = 11'h000;
      expv[25] = 11'h000;
      expv[26] = 11'h000;
      expv[27] = 11'h000;
      expv[28] = 11'h000;
      expv[29] = 11'h000;
      expv[30] = 11'h000;
      expv[31] = 11'h000;
      expv[32] = 11'h000;
      expv[33] = 11'h000;
      expv[34] = 11'h000;
      expv[35] = 11'h000;
      expv[36] = 11'h000;
      expv[37] = 11'h000;
      expv[38] = 11'h000;
      expv[39] = 11'h000;
      expv[40] = 11'h000;
      expv[41] = 11'h000;
      expv[42] = 11'h000;
      expv[43] = 11'h000;
      expv[44] = 11'h000;
      expv[45] = 11'h000;
      expv[46] = 11'h000;
      expv[47] = 11'h000;
      expv[48] = 11'h000;
      expv[49] = 11'h000;
      expv[50] = 11'h000;
      expv[51] = 11'h000;
      expv[52] = 11'h000;
      expv[53] = 11'h000;
      expv[54] = 11'h000;
      expv[55] = 11'h000;
      expv[56] = 11'h000;
      expv[57] = 11'h000;
      expv[58] = 11'h000;
      expv[59] = 11'h000;
      expv[60] = 11'h000;
      expv[61] = 11'h000;
      expv[62] = 11'h000;
      expv[63] = 11'h000;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
