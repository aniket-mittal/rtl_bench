// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  vga_fifo dut (
    .clk(clk),
    .aclr(in_vec[11:11]),
    .sclr(in_vec[10:10]),
    .wreq(in_vec[9:9]),
    .rreq(in_vec[8:8]),
    .d(in_vec[7:0]),
    .q(out_vec[15:8]),
    .nword(out_vec[7:4]),
    .empty(out_vec[3:3]),
    .full(out_vec[2:2]),
    .aempty(out_vec[1:1]),
    .afull(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h124;
    stim[1] = 12'h10c;
    stim[2] = 12'ha31;
    stim[3] = 12'h842;
    stim[4] = 12'hb24;
    stim[5] = 12'ha1f;
    stim[6] = 12'h95a;
    stim[7] = 12'hace;
    stim[8] = 12'hb4e;
    stim[9] = 12'h9c5;
    stim[10] = 12'h89d;
    stim[11] = 12'h9b7;
    stim[12] = 12'hde6;
    stim[13] = 12'hea2;
    stim[14] = 12'hff3;
    stim[15] = 12'hdd3;
    stim[16] = 12'h9f5;
    stim[17] = 12'hcc6;
    stim[18] = 12'h803;
    stim[19] = 12'hab5;
    stim[20] = 12'he84;
    stim[21] = 12'hd79;
    stim[22] = 12'hd0f;
    stim[23] = 12'h893;
    stim[24] = 12'hb3f;
    stim[25] = 12'hf62;
    stim[26] = 12'h946;
    stim[27] = 12'hef6;
    stim[28] = 12'hbae;
    stim[29] = 12'hbe4;
    stim[30] = 12'hc16;
    stim[31] = 12'hf6a;
    stim[32] = 12'h86b;
    stim[33] = 12'he8c;
    stim[34] = 12'hc84;
    stim[35] = 12'he08;
    stim[36] = 12'hab3;
    stim[37] = 12'h997;
    stim[38] = 12'hc32;
    stim[39] = 12'hd76;
    stim[40] = 12'ha18;
    stim[41] = 12'hd5b;
    stim[42] = 12'hac8;
    stim[43] = 12'h9e1;
    stim[44] = 12'ha7b;
    stim[45] = 12'hb31;
    stim[46] = 12'hfa5;
    stim[47] = 12'hb6c;
    stim[48] = 12'h9e2;
    stim[49] = 12'h91f;
    stim[50] = 12'hd71;
    stim[51] = 12'h9be;
    stim[52] = 12'hb49;
    stim[53] = 12'h996;
    stim[54] = 12'hf42;
    stim[55] = 12'hd66;
    stim[56] = 12'hbb6;
    stim[57] = 12'hc84;
    stim[58] = 12'hae4;
    stim[59] = 12'hebf;
    stim[60] = 12'hca5;
    stim[61] = 12'h89a;
    stim[62] = 12'hdae;
    stim[63] = 12'h7f4;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 16'hxx08;
      expv[1] = 16'hxx08;
      expv[2] = 16'hxx08;
      expv[3] = 16'h3110;
      expv[4] = 16'h3110;
      expv[5] = 16'h2410;
      expv[6] = 16'h2420;
      expv[7] = 16'h1f10;
      expv[8] = 16'h1f20;
      expv[9] = 16'hce20;
      expv[10] = 16'h4e10;
      expv[11] = 16'h4e12;
      expv[12] = 16'hxx08;
      expv[13] = 16'h3108;
      expv[14] = 16'ha208;
      expv[15] = 16'hf308;
      expv[16] = 16'hf308;
      expv[17] = 16'h24f0;
      expv[18] = 16'hf308;
      expv[19] = 16'hf308;
      expv[20] = 16'hb510;
      expv[21] = 16'hb508;
      expv[22] = 16'hb508;
      expv[23] = 16'hb508;
      expv[24] = 16'hb508;
      expv[25] = 16'h8408;
      expv[26] = 16'h3f08;
      expv[27] = 16'h62f1;
      expv[28] = 16'hf608;
      expv[29] = 16'h6208;
      expv[30] = 16'h1f08;
      expv[31] = 16'hae08;
      expv[32] = 16'h6a08;
      expv[33] = 16'h6a08;
      expv[34] = 16'h8c08;
      expv[35] = 16'h8c08;
      expv[36] = 16'h0808;
      expv[37] = 16'hb312;
      expv[38] = 16'he408;
      expv[39] = 16'hb308;
      expv[40] = 16'hb308;
      expv[41] = 16'h1812;
      expv[42] = 16'h1808;
      expv[43] = 16'hc812;
      expv[44] = 16'he408;
      expv[45] = 16'h7b10;
      expv[46] = 16'h3110;
      expv[47] = 16'hc808;
      expv[48] = 16'h7b08;
      expv[49] = 16'h31f0;
      expv[50] = 16'ha5e0;
      expv[51] = 16'h6c08;
      expv[52] = 16'h7bf0;
      expv[53] = 16'h31f0;
      expv[54] = 16'ha5e0;
      expv[55] = 16'h4908;
      expv[56] = 16'h4908;
      expv[57] = 16'h4208;
      expv[58] = 16'hb608;
      expv[59] = 16'he410;
      expv[60] = 16'he408;
      expv[61] = 16'he408;
      expv[62] = 16'he408;
      expv[63] = 16'he408;
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
