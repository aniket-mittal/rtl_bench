// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .d(in_vec[12:12]),
    .done_counting(in_vec[11:11]),
    .ack(in_vec[10:10]),
    .state(in_vec[9:0]),
    .B3_next(out_vec[7:7]),
    .S_next(out_vec[6:6]),
    .S1_next(out_vec[5:5]),
    .Count_next(out_vec[4:4]),
    .Wait_next(out_vec[3:3]),
    .done(out_vec[2:2]),
    .counting(out_vec[1:1]),
    .shift_ena(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h1764;
    stim[1] = 13'h026c;
    stim[2] = 13'h195f;
    stim[3] = 13'h1199;
    stim[4] = 13'h1af6;
    stim[5] = 13'h145a;
    stim[6] = 13'h1204;
    stim[7] = 13'h142a;
    stim[8] = 13'h1eca;
    stim[9] = 13'h17b0;
    stim[10] = 13'h0d45;
    stim[11] = 13'h1f88;
    stim[12] = 13'h0da4;
    stim[13] = 13'h0bd4;
    stim[14] = 13'h1c7f;
    stim[15] = 13'h196d;
    stim[16] = 13'h03ec;
    stim[17] = 13'h10a5;
    stim[18] = 13'h1a2f;
    stim[19] = 13'h0709;
    stim[20] = 13'h10d8;
    stim[21] = 13'h1e27;
    stim[22] = 13'h0b5d;
    stim[23] = 13'h0638;
    stim[24] = 13'h0b48;
    stim[25] = 13'h088a;
    stim[26] = 13'h1a7f;
    stim[27] = 13'h0b9e;
    stim[28] = 13'h0601;
    stim[29] = 13'h0b3b;
    stim[30] = 13'h1bb7;
    stim[31] = 13'h0515;
    stim[32] = 13'h0160;
    stim[33] = 13'h13fb;
    stim[34] = 13'h1e72;
    stim[35] = 13'h17ea;
    stim[36] = 13'h116c;
    stim[37] = 13'h1f29;
    stim[38] = 13'h08cc;
    stim[39] = 13'h1cc6;
    stim[40] = 13'h0ad1;
    stim[41] = 13'h1a8b;
    stim[42] = 13'h0068;
    stim[43] = 13'h020b;
    stim[44] = 13'h1f2b;
    stim[45] = 13'h0b54;
    stim[46] = 13'h0aa9;
    stim[47] = 13'h0aa3;
    stim[48] = 13'h0f15;
    stim[49] = 13'h0735;
    stim[50] = 13'h1596;
    stim[51] = 13'h03a0;
    stim[52] = 13'h1982;
    stim[53] = 13'h0230;
    stim[54] = 13'h0b0d;
    stim[55] = 13'h0372;
    stim[56] = 13'h0120;
    stim[57] = 13'h1f8b;
    stim[58] = 13'h1dd6;
    stim[59] = 13'h0012;
    stim[60] = 13'h005d;
    stim[61] = 13'h1687;
    stim[62] = 13'h10f4;
    stim[63] = 13'h016a;
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
      expv[0] = 8'hd6;
      expv[1] = 8'hcc;
      expv[2] = 8'haa;
      expv[3] = 8'h32;
      expv[4] = 8'h9d;
      expv[5] = 8'h80;
      expv[6] = 8'h0c;
      expv[7] = 8'h00;
      expv[8] = 8'hd4;
      expv[9] = 8'h56;
      expv[10] = 8'hca;
      expv[11] = 8'h5e;
      expv[12] = 8'h1a;
      expv[13] = 8'h9e;
      expv[14] = 8'ha0;
      expv[15] = 8'haa;
      expv[16] = 8'hde;
      expv[17] = 8'h30;
      expv[18] = 8'h2c;
      expv[19] = 8'h56;
      expv[20] = 8'h90;
      expv[21] = 8'h64;
      expv[22] = 8'hce;
      expv[23] = 8'h44;
      expv[24] = 8'hce;
      expv[25] = 8'h50;
      expv[26] = 8'hac;
      expv[27] = 8'h5e;
      expv[28] = 8'h44;
      expv[29] = 8'h4e;
      expv[30] = 8'h3e;
      expv[31] = 8'h52;
      expv[32] = 8'h92;
      expv[33] = 8'hbf;
      expv[34] = 8'hc4;
      expv[35] = 8'hd6;
      expv[36] = 8'h92;
      expv[37] = 8'h6e;
      expv[38] = 8'hd0;
      expv[39] = 8'h90;
      expv[40] = 8'hdc;
      expv[41] = 8'h3c;
      expv[42] = 8'hc0;
      expv[43] = 8'h4c;
      expv[44] = 8'h6e;
      expv[45] = 8'h8e;
      expv[46] = 8'h5c;
      expv[47] = 8'h5c;
      expv[48] = 8'h4e;
      expv[49] = 8'h56;
      expv[50] = 8'h12;
      expv[51] = 8'h1e;
      expv[52] = 8'h1a;
      expv[53] = 8'h0c;
      expv[54] = 8'h4e;
      expv[55] = 8'hde;
      expv[56] = 8'h12;
      expv[57] = 8'h7e;
      expv[58] = 8'h9a;
      expv[59] = 8'h40;
      expv[60] = 8'hc0;
      expv[61] = 8'h74;
      expv[62] = 8'h91;
      expv[63] = 8'hd2;
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
