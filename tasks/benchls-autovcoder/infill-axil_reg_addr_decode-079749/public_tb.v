// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_079749 dut (
    .axaddr(in_vec[31:0]),
    .reg_decode_num(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h9f5d7849;
    stim[1] = 32'h5b42f69e;
    stim[2] = 32'h66fbeb70;
    stim[3] = 32'h95182746;
    stim[4] = 32'hb5caf319;
    stim[5] = 32'h39a14e9d;
    stim[6] = 32'hf334c9d9;
    stim[7] = 32'h67f13405;
    stim[8] = 32'hc17469c5;
    stim[9] = 32'he397710a;
    stim[10] = 32'h45db8e82;
    stim[11] = 32'hf43a5f29;
    stim[12] = 32'hca1749a8;
    stim[13] = 32'h9c638f64;
    stim[14] = 32'h830b8bd9;
    stim[15] = 32'hfebd8392;
    stim[16] = 32'h725d0dd0;
    stim[17] = 32'h71b902d3;
    stim[18] = 32'h95ed11fe;
    stim[19] = 32'ha4cb1882;
    stim[20] = 32'hf413f463;
    stim[21] = 32'hbb047e22;
    stim[22] = 32'hfc0a7f72;
    stim[23] = 32'h92139682;
    stim[24] = 32'h0e17b90a;
    stim[25] = 32'h2de46e1b;
    stim[26] = 32'hcd6c5860;
    stim[27] = 32'hd36184e8;
    stim[28] = 32'h8a19817b;
    stim[29] = 32'h3dbb6e14;
    stim[30] = 32'ha4cc376f;
    stim[31] = 32'h418b5362;
    stim[32] = 32'ha38c299b;
    stim[33] = 32'ha94c4854;
    stim[34] = 32'h150670e9;
    stim[35] = 32'ha63804ec;
    stim[36] = 32'h85b0c5b6;
    stim[37] = 32'hbfcd6c63;
    stim[38] = 32'hed957176;
    stim[39] = 32'hf3a493a4;
    stim[40] = 32'hc721a783;
    stim[41] = 32'h8c718bbd;
    stim[42] = 32'h033b37ba;
    stim[43] = 32'h4309b15a;
    stim[44] = 32'hd73813b9;
    stim[45] = 32'h0144295a;
    stim[46] = 32'hf4287a03;
    stim[47] = 32'h22107d82;
    stim[48] = 32'h4165b727;
    stim[49] = 32'h9d2d4117;
    stim[50] = 32'h40cdb03a;
    stim[51] = 32'hab5d34c0;
    stim[52] = 32'hd4ce9057;
    stim[53] = 32'h9af22470;
    stim[54] = 32'ha06a098b;
    stim[55] = 32'h1276160b;
    stim[56] = 32'h8b42caaa;
    stim[57] = 32'h8e20272b;
    stim[58] = 32'hf8f8ff00;
    stim[59] = 32'hf9676822;
    stim[60] = 32'h77f55944;
    stim[61] = 32'h375f8a5a;
    stim[62] = 32'h3950e3f4;
    stim[63] = 32'heec1eeb5;
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
      expv[0] = 3'h0;
      expv[1] = 3'h0;
      expv[2] = 3'h0;
      expv[3] = 3'h2;
      expv[4] = 3'h0;
      expv[5] = 3'h0;
      expv[6] = 3'h0;
      expv[7] = 3'h2;
      expv[8] = 3'h2;
      expv[9] = 3'h0;
      expv[10] = 3'h0;
      expv[11] = 3'h0;
      expv[12] = 3'h0;
      expv[13] = 3'h2;
      expv[14] = 3'h0;
      expv[15] = 3'h0;
      expv[16] = 3'h0;
      expv[17] = 3'h0;
      expv[18] = 3'h0;
      expv[19] = 3'h0;
      expv[20] = 3'h0;
      expv[21] = 3'h0;
      expv[22] = 3'h0;
      expv[23] = 3'h0;
      expv[24] = 3'h0;
      expv[25] = 3'h0;
      expv[26] = 3'h0;
      expv[27] = 3'h0;
      expv[28] = 3'h0;
      expv[29] = 3'h2;
      expv[30] = 3'h0;
      expv[31] = 3'h0;
      expv[32] = 3'h0;
      expv[33] = 3'h2;
      expv[34] = 3'h0;
      expv[35] = 3'h0;
      expv[36] = 3'h2;
      expv[37] = 3'h0;
      expv[38] = 3'h2;
      expv[39] = 3'h2;
      expv[40] = 3'h0;
      expv[41] = 3'h0;
      expv[42] = 3'h0;
      expv[43] = 3'h0;
      expv[44] = 3'h0;
      expv[45] = 3'h0;
      expv[46] = 3'h0;
      expv[47] = 3'h0;
      expv[48] = 3'h2;
      expv[49] = 3'h2;
      expv[50] = 3'h0;
      expv[51] = 3'h0;
      expv[52] = 3'h2;
      expv[53] = 3'h0;
      expv[54] = 3'h0;
      expv[55] = 3'h0;
      expv[56] = 3'h0;
      expv[57] = 3'h0;
      expv[58] = 3'h0;
      expv[59] = 3'h0;
      expv[60] = 3'h2;
      expv[61] = 3'h0;
      expv[62] = 3'h2;
      expv[63] = 3'h2;
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
