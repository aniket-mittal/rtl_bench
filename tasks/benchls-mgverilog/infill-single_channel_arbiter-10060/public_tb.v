// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10060 dut (
    .clk(clk),
    .reset(in_vec[39:39]),
    .io_out_ready(in_vec[38:38]),
    .io_in_0_valid(in_vec[37:37]),
    .io_in_0_bits(in_vec[36:5]),
    .io_in_0_tag(in_vec[4:0]),
    .io_out_valid(out_vec[39:39]),
    .io_out_bits(out_vec[38:7]),
    .io_out_tag(out_vec[6:2]),
    .io_in_0_ready(out_vec[1:1]),
    .io_chosen(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'hd8f8ec94e9;
    stim[1] = 40'h8f9955c00e;
    stim[2] = 40'h0b60f5917a;
    stim[3] = 40'h3a097295a1;
    stim[4] = 40'h5d96ad8cec;
    stim[5] = 40'h005f66c91a;
    stim[6] = 40'h3d36c3c201;
    stim[7] = 40'h5d41864fac;
    stim[8] = 40'h251d13ec42;
    stim[9] = 40'h7865990b3e;
    stim[10] = 40'h135e75744c;
    stim[11] = 40'h6caef6c92b;
    stim[12] = 40'hc9b864ef2c;
    stim[13] = 40'h781442d9a8;
    stim[14] = 40'h67a0d6ea74;
    stim[15] = 40'h19a6d2d3f5;
    stim[16] = 40'h521b9c0a37;
    stim[17] = 40'h51f5855ec6;
    stim[18] = 40'h42a4b18194;
    stim[19] = 40'h10142822f6;
    stim[20] = 40'h29eb63b16f;
    stim[21] = 40'h28384497b6;
    stim[22] = 40'h12bee0e185;
    stim[23] = 40'h7e8f239bac;
    stim[24] = 40'h4ff2e43572;
    stim[25] = 40'h1cf85029f1;
    stim[26] = 40'h3c40f325db;
    stim[27] = 40'h5aacce8c47;
    stim[28] = 40'h3a69cdfca7;
    stim[29] = 40'h34628f96a4;
    stim[30] = 40'h1d8575181a;
    stim[31] = 40'h13ec7929f0;
    stim[32] = 40'h04dc55c35d;
    stim[33] = 40'h10a5c3a284;
    stim[34] = 40'h30cace18a0;
    stim[35] = 40'h22db5e7ac6;
    stim[36] = 40'h36e4bb9002;
    stim[37] = 40'h663af7db31;
    stim[38] = 40'h0581ce6457;
    stim[39] = 40'h25ee9b372e;
    stim[40] = 40'h68034a202b;
    stim[41] = 40'h465a1a2dfb;
    stim[42] = 40'h3d079c4c08;
    stim[43] = 40'h100a60cda8;
    stim[44] = 40'h21f1b38711;
    stim[45] = 40'h26e18259e9;
    stim[46] = 40'h0d895d2868;
    stim[47] = 40'h2c6e4ff4fe;
    stim[48] = 40'h51fb037681;
    stim[49] = 40'h0d57327d7a;
    stim[50] = 40'h31087bb35a;
    stim[51] = 40'h00e0b1d84d;
    stim[52] = 40'h7de5b82455;
    stim[53] = 40'h6cad1d9c96;
    stim[54] = 40'h0719d050ad;
    stim[55] = 40'h0e07f2ab3e;
    stim[56] = 40'h769f4eafd7;
    stim[57] = 40'h688d2994cb;
    stim[58] = 40'h675333dfb1;
    stim[59] = 40'h7d68f6b8e1;
    stim[60] = 40'h7f7636f1b5;
    stim[61] = 40'h0962e5fa18;
    stim[62] = 40'hfecae3bad6;
    stim[63] = 40'h1a45ad371f;
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
      expv[0] = 40'h63e3b253ax;
      expv[1] = 40'h3e6557003x;
      expv[2] = 40'h2d83d645ex;
      expv[3] = 40'he825ca568x;
      expv[4] = 40'h765ab633bx;
      expv[5] = 40'h017d9b246x;
      expv[6] = 40'hf4db0f080x;
      expv[7] = 40'h7506193ebx;
      expv[8] = 40'h94744fb10x;
      expv[9] = 40'he196642cfx;
      expv[10] = 40'h4d79d5d13x;
      expv[11] = 40'hb2bbdb24ax;
      expv[12] = 40'h26e193bcbx;
      expv[13] = 40'he0510b66ax;
      expv[14] = 40'h9e835ba9dx;
      expv[15] = 40'h669b4b4fdx;
      expv[16] = 40'h486e7028dx;
      expv[17] = 40'h47d6157b1x;
      expv[18] = 40'h0a92c6065x;
      expv[19] = 40'h4050a08bdx;
      expv[20] = 40'ha7ad8ec5bx;
      expv[21] = 40'ha0e1125edx;
      expv[22] = 40'h4afb83861x;
      expv[23] = 40'hfa3c8e6ebx;
      expv[24] = 40'h3fcb90d5cx;
      expv[25] = 40'h73e140a7cx;
      expv[26] = 40'hf103cc976x;
      expv[27] = 40'h6ab33a311x;
      expv[28] = 40'he9a737f29x;
      expv[29] = 40'hd18a3e5a9x;
      expv[30] = 40'h7615d4606x;
      expv[31] = 40'h4fb1e4a7cx;
      expv[32] = 40'h1371570d7x;
      expv[33] = 40'h42970e8a1x;
      expv[34] = 40'hc32b38628x;
      expv[35] = 40'h8b6d79eb1x;
      expv[36] = 40'hdb92ee400x;
      expv[37] = 40'h98ebdf6ccx;
      expv[38] = 40'h160739915x;
      expv[39] = 40'h97ba6cdcbx;
      expv[40] = 40'ha00d2880ax;
      expv[41] = 40'h196868b7ex;
      expv[42] = 40'hf41e71302x;
      expv[43] = 40'h40298336ax;
      expv[44] = 40'h87c6ce1c4x;
      expv[45] = 40'h9b860967ax;
      expv[46] = 40'h362574a1ax;
      expv[47] = 40'hb1b93fd3fx;
      expv[48] = 40'h47ec0dda0x;
      expv[49] = 40'h355cc9f5ex;
      expv[50] = 40'hc421eecd6x;
      expv[51] = 40'h0382c7613x;
      expv[52] = 40'hf796e0915x;
      expv[53] = 40'hb2b476725x;
      expv[54] = 40'h1c674142bx;
      expv[55] = 40'h381fcaacfx;
      expv[56] = 40'hda7d3abf5x;
      expv[57] = 40'ha234a6532x;
      expv[58] = 40'h9d4ccf7ecx;
      expv[59] = 40'hf5a3dae38x;
      expv[60] = 40'hfdd8dbc6dx;
      expv[61] = 40'h258b97e86x;
      expv[62] = 40'hfb2b8eeb5x;
      expv[63] = 40'h6916b4dc7x;
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
