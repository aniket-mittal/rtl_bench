// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_196664 dut (
    .a(in_vec[67:36]),
    .b(in_vec[35:4]),
    .aluc(in_vec[3:0]),
    .r(out_vec[35:4]),
    .zero(out_vec[3:3]),
    .carry(out_vec[2:2]),
    .negative(out_vec[1:1]),
    .overflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'hfba5858fda5d1bdf3;
    stim[1] = 68'hea76453a438c15698;
    stim[2] = 68'h7633f1921cbe5e816;
    stim[3] = 68'headc14c1d54657ac2;
    stim[4] = 68'h36dee39d8e8d2bd31;
    stim[5] = 68'hb73a5cd9c4b09509b;
    stim[6] = 68'hc61d634045600412d;
    stim[7] = 68'h590a48f96ed03677f;
    stim[8] = 68'h918094deb9553c181;
    stim[9] = 68'h7fa09350a46da5b8d;
    stim[10] = 68'h6af95833ad86d2b16;
    stim[11] = 68'h49954d9aa6cb17cf6;
    stim[12] = 68'h1069402c7340b4dd4;
    stim[13] = 68'h3464522cd02e357da;
    stim[14] = 68'hc907d1832004cca8d;
    stim[15] = 68'h109d2e073c1b271ae;
    stim[16] = 68'h0d3d6e2269219ee8d;
    stim[17] = 68'hb33dde124913adb87;
    stim[18] = 68'h8ad7f27e484e3273e;
    stim[19] = 68'hae8418009b49647b9;
    stim[20] = 68'h28bb360342b36c0cb;
    stim[21] = 68'h46eef71ce536ae4f3;
    stim[22] = 68'hab8bbcedebf9682d1;
    stim[23] = 68'h68a555fa049e0918e;
    stim[24] = 68'hf54035082f274d31f;
    stim[25] = 68'h0e971b335f68199fe;
    stim[26] = 68'h7f7d15134acdb1d7f;
    stim[27] = 68'heb07cb6f084720998;
    stim[28] = 68'h8ee8eaa6b3f2fddda;
    stim[29] = 68'h6b005be31a98d1e6a;
    stim[30] = 68'h491caa5f2cb69a7a8;
    stim[31] = 68'h543c86d9e9a8eb2a0;
    stim[32] = 68'hf47215ea037025b91;
    stim[33] = 68'h0c43e5f75c66c08a9;
    stim[34] = 68'ha606a3d649edb63b7;
    stim[35] = 68'h007d2ddbf94a93823;
    stim[36] = 68'h88409efaefe045c1e;
    stim[37] = 68'haee0f6703b21f1987;
    stim[38] = 68'h729a7c6ad15c26857;
    stim[39] = 68'h5d79de1f98222cb86;
    stim[40] = 68'h6e1134a9ee88c92d3;
    stim[41] = 68'h7a78c42d658ce3a57;
    stim[42] = 68'hef91e85bb9f52af53;
    stim[43] = 68'h6e977354b0fd43430;
    stim[44] = 68'ha5e42779aeed8660b;
    stim[45] = 68'ha0b5203dc7e223f06;
    stim[46] = 68'hd3c83c390df969a7b;
    stim[47] = 68'hab8ee6587b8c1fbfb;
    stim[48] = 68'h2811c204e4875ce1c;
    stim[49] = 68'hd8e5380945713413c;
    stim[50] = 68'h388c48f87de8621ed;
    stim[51] = 68'h79b4186b662f334a4;
    stim[52] = 68'hace940255d55b95f9;
    stim[53] = 68'hfa2691706d3c2b81d;
    stim[54] = 68'h5316503163ab4e5f2;
    stim[55] = 68'h7906f6a2a85e07b3c;
    stim[56] = 68'h5bd8930bcf4b6fe88;
    stim[57] = 68'h5728c7ca966a11bd9;
    stim[58] = 68'h847e4195143a61a68;
    stim[59] = 68'h5584d2a5c00d7e74f;
    stim[60] = 68'h75e54acae2492347b;
    stim[61] = 68'h7d007cc49795853ac;
    stim[62] = 68'h06728d16945aa5510;
    stim[63] = 68'hfd0697a881263a8bd;
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
      expv[0] = 36'h214869b00;
      expv[1] = 36'h156900000;
      expv[2] = 36'h6a8daf130;
      expv[3] = 36'h1595bd150;
      expv[4] = 36'hc56c0f702;
      expv[5] = 36'h000000010;
      expv[6] = 36'h000000008;
      expv[7] = 36'h000000008;
      expv[8] = 36'h4ad5d0f65;
      expv[9] = 36'h000000008;
      expv[10] = 36'hc77f8a822;
      expv[11] = 36'hef5e5a552;
      expv[12] = 36'h1040000c0;
      expv[13] = 36'h000000008;
      expv[14] = 36'h000000008;
      expv[15] = 36'h000000008;
      expv[16] = 36'h000000008;
      expv[17] = 36'h04c000450;
      expv[18] = 36'h000000008;
      expv[19] = 36'hae8418002;
      expv[20] = 36'h000000010;
      expv[21] = 36'h61b848cd4;
      expv[22] = 36'h9785251a6;
      expv[23] = 36'h000000008;
      expv[24] = 36'h000000008;
      expv[25] = 36'h000000008;
      expv[26] = 36'h000000008;
      expv[27] = 36'h209900000;
      expv[28] = 36'h000000010;
      expv[29] = 36'h000000008;
      expv[30] = 36'h9a7a00002;
      expv[31] = 36'h3de572034;
      expv[32] = 36'hf7e23ba32;
      expv[33] = 36'h0c43e5f70;
      expv[34] = 36'h101048000;
      expv[35] = 36'h07329a594;
      expv[36] = 36'h000000008;
      expv[37] = 36'h401e08070;
      expv[38] = 36'h0c2181100;
      expv[39] = 36'hc55bf2a72;
      expv[40] = 36'h7f886b7c4;
      expv[41] = 36'h800318522;
      expv[42] = 36'h359cbd660;
      expv[43] = 36'h1f94b6974;
      expv[44] = 36'h000000010;
      expv[45] = 36'h675703cd0;
      expv[46] = 36'h000000008;
      expv[47] = 36'h000000008;
      expv[48] = 36'hffffffff2;
      expv[49] = 36'h000000008;
      expv[50] = 36'h000000008;
      expv[51] = 36'h6024104a0;
      expv[52] = 36'hace940252;
      expv[53] = 36'h000000008;
      expv[54] = 36'hef6b01d26;
      expv[55] = 36'hffffffff2;
      expv[56] = 36'h6fe800000;
      expv[57] = 36'h5728c7ca0;
      expv[58] = 36'h61a600000;
      expv[59] = 36'h000000008;
      expv[60] = 36'h000000010;
      expv[61] = 36'hffffffff2;
      expv[62] = 36'h9acd32672;
      expv[63] = 36'h000000008;
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
