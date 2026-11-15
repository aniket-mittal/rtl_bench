// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_060116 dut (
    .instruction(in_vec[31:0]),
    .Af(out_vec[23:20]),
    .I(out_vec[19:19]),
    .ALU_MUX_SEL(out_vec[18:18]),
    .Cad(out_vec[17:13]),
    .GP_WE(out_vec[12:12]),
    .GP_MUX_SEL(out_vec[11:10]),
    .Bf(out_vec[9:6]),
    .PC_MUX_SEL(out_vec[5:4]),
    .DM_WE(out_vec[3:3]),
    .Shift_type(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'he7bf17d5;
    stim[1] = 32'hd926b8e2;
    stim[2] = 32'h8392e222;
    stim[3] = 32'h4f050c66;
    stim[4] = 32'hcec6793c;
    stim[5] = 32'h7b85e446;
    stim[6] = 32'h6f002b3f;
    stim[7] = 32'h7ef5ec84;
    stim[8] = 32'h6d79a32e;
    stim[9] = 32'hf30e4dfc;
    stim[10] = 32'h60109645;
    stim[11] = 32'h59881f3a;
    stim[12] = 32'h25434731;
    stim[13] = 32'h128c1c14;
    stim[14] = 32'hbb85345f;
    stim[15] = 32'h097c460f;
    stim[16] = 32'h4458c73c;
    stim[17] = 32'h8aca103b;
    stim[18] = 32'h112d7e7e;
    stim[19] = 32'hf1518282;
    stim[20] = 32'ha0ae1a9a;
    stim[21] = 32'heac54e90;
    stim[22] = 32'he61a2025;
    stim[23] = 32'h88393eaa;
    stim[24] = 32'hc348aa64;
    stim[25] = 32'h37d58dbb;
    stim[26] = 32'hde4f622e;
    stim[27] = 32'h4c78e2cb;
    stim[28] = 32'h7ca5651c;
    stim[29] = 32'h47bcb746;
    stim[30] = 32'hf53196d2;
    stim[31] = 32'hd048641f;
    stim[32] = 32'hb58404d6;
    stim[33] = 32'h7b65bc0f;
    stim[34] = 32'h7291313e;
    stim[35] = 32'hc82b63cb;
    stim[36] = 32'h2a7bf25c;
    stim[37] = 32'hcb95896a;
    stim[38] = 32'h8691f91e;
    stim[39] = 32'h7f76c15f;
    stim[40] = 32'h9bf2c993;
    stim[41] = 32'h353cc17e;
    stim[42] = 32'h71adcac4;
    stim[43] = 32'h1efc8fb5;
    stim[44] = 32'hcd23ee44;
    stim[45] = 32'hfa489121;
    stim[46] = 32'hd77d6f17;
    stim[47] = 32'hf65a9dc6;
    stim[48] = 32'hdb5b7fda;
    stim[49] = 32'h0d6950c1;
    stim[50] = 32'hac13d8fd;
    stim[51] = 32'h8e4bcc22;
    stim[52] = 32'h68c8a055;
    stim[53] = 32'h65ddc7e3;
    stim[54] = 32'hda85bda8;
    stim[55] = 32'h6bc6c0e1;
    stim[56] = 32'hb509350d;
    stim[57] = 32'h8816e4e1;
    stim[58] = 32'h89bd273c;
    stim[59] = 32'h1ccce546;
    stim[60] = 32'hd01219d4;
    stim[61] = 32'h96f0597f;
    stim[62] = 32'hc6323264;
    stim[63] = 32'h09863952;
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
      expv[0] = 24'h000000;
      expv[1] = 24'h000000;
      expv[2] = 24'h000000;
      expv[3] = 24'h000000;
      expv[4] = 24'h000000;
      expv[5] = 24'h000000;
      expv[6] = 24'h000000;
      expv[7] = 24'h000000;
      expv[8] = 24'h000000;
      expv[9] = 24'h000000;
      expv[10] = 24'h000000;
      expv[11] = 24'h000000;
      expv[12] = 24'h000000;
      expv[13] = 24'h000010;
      expv[14] = 24'h000000;
      expv[15] = 24'h000020;
      expv[16] = 24'h000000;
      expv[17] = 24'h000000;
      expv[18] = 24'h000010;
      expv[19] = 24'h000000;
      expv[20] = 24'h000000;
      expv[21] = 24'h000000;
      expv[22] = 24'h000000;
      expv[23] = 24'h000000;
      expv[24] = 24'h000000;
      expv[25] = 24'h1eb000;
      expv[26] = 24'h000000;
      expv[27] = 24'h000000;
      expv[28] = 24'h000000;
      expv[29] = 24'h000000;
      expv[30] = 24'h000000;
      expv[31] = 24'h000000;
      expv[32] = 24'h000000;
      expv[33] = 24'h000000;
      expv[34] = 24'h000000;
      expv[35] = 24'h000000;
      expv[36] = 24'h000000;
      expv[37] = 24'h000000;
      expv[38] = 24'h000000;
      expv[39] = 24'h000000;
      expv[40] = 24'h000000;
      expv[41] = 24'h1f9000;
      expv[42] = 24'h000000;
      expv[43] = 24'h000000;
      expv[44] = 24'h000000;
      expv[45] = 24'h000000;
      expv[46] = 24'h000000;
      expv[47] = 24'h000000;
      expv[48] = 24'h000000;
      expv[49] = 24'h03f820;
      expv[50] = 24'h2c0008;
      expv[51] = 24'h2d7400;
      expv[52] = 24'h000000;
      expv[53] = 24'h000000;
      expv[54] = 24'h000000;
      expv[55] = 24'h000000;
      expv[56] = 24'h000000;
      expv[57] = 24'h000000;
      expv[58] = 24'h000000;
      expv[59] = 24'h000000;
      expv[60] = 24'h000000;
      expv[61] = 24'h000000;
      expv[62] = 24'h000000;
      expv[63] = 24'h000020;
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
