// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 58;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04857 dut (
    .clk(clk),
    .rst(in_vec[64:64]),
    .opa_i(in_vec[63:32]),
    .opb_i(in_vec[31:0]),
    .exp_10_o(out_vec[57:48]),
    .fracta_24_o(out_vec[47:24]),
    .fractb_24_o(out_vec[23:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h184f421e503470664;
    stim[1] = 65'h1d6cd6f6da321e574;
    stim[2] = 65'h01eae6a5d5fd49c54;
    stim[3] = 65'h0abe3f37c184bab28;
    stim[4] = 65'h0794f359cf7c87451;
    stim[5] = 65'h096825fbce30a9e5f;
    stim[6] = 65'h0e183c2e49942d005;
    stim[7] = 65'h02e984cfe1804afad;
    stim[8] = 65'h0baacf862d24f26f9;
    stim[9] = 65'h040d385b175038029;
    stim[10] = 65'h03b5c3058bac49126;
    stim[11] = 65'h0128495781a238f67;
    stim[12] = 65'h015af4ae93b535f2c;
    stim[13] = 65'h17371ee4a45af55ec;
    stim[14] = 65'h0a389143d99e19071;
    stim[15] = 65'h053fe223012daa222;
    stim[16] = 65'h0790929d9573f774c;
    stim[17] = 65'h0d8601697dc259cd5;
    stim[18] = 65'h097ab8245134a60e3;
    stim[19] = 65'h0e9e53fb4b168a013;
    stim[20] = 65'h088a7b008ee868e7b;
    stim[21] = 65'h0dbf3cc5201de48fd;
    stim[22] = 65'h0df9073696c93c2ae;
    stim[23] = 65'h0eb71f001fa4fac8b;
    stim[24] = 65'h09712b9cc73ddcbb1;
    stim[25] = 65'h079ef03ab370cc24f;
    stim[26] = 65'h0f8761589203dbb64;
    stim[27] = 65'h02099ecf616b8af52;
    stim[28] = 65'h0564be35ae3c6f59d;
    stim[29] = 65'h02c14cff5d34371a7;
    stim[30] = 65'h0ad5d1ec5dedba552;
    stim[31] = 65'h03fe94fa4e58d85fc;
    stim[32] = 65'h065a605c8d6bbbf20;
    stim[33] = 65'h05915823425d8c8d5;
    stim[34] = 65'h0b75c52766e9b782e;
    stim[35] = 65'h04d35ea9fa1c723a9;
    stim[36] = 65'h0ccff3278d21f7500;
    stim[37] = 65'h07c5bd2b3f9730c0e;
    stim[38] = 65'h01ade4d5db30571a2;
    stim[39] = 65'h0a4b9e12a98c88274;
    stim[40] = 65'h0ca188d59fda513f4;
    stim[41] = 65'h05130fc263d1eed4c;
    stim[42] = 65'h081088448819e904a;
    stim[43] = 65'h0ff49f7ef158f586c;
    stim[44] = 65'h0bddbb5a19179eaa5;
    stim[45] = 65'h09831a76d0934c9eb;
    stim[46] = 65'h0174473f2efe9d7c1;
    stim[47] = 65'h00815d4f4788dbfbe;
    stim[48] = 65'h0e2dafb9799c14a2c;
    stim[49] = 65'h0809ff42f51a80a22;
    stim[50] = 65'h05d3e4ad286015964;
    stim[51] = 65'h0dde7b966f245373d;
    stim[52] = 65'h01d4cbd74976f0a08;
    stim[53] = 65'h05debfaa98108ca7e;
    stim[54] = 65'h0db0d5796e9acb43f;
    stim[55] = 65'h090fd16f5a6f3ef29;
    stim[56] = 65'h00c8433654b4a23a7;
    stim[57] = 65'h04977b195a30b4af3;
    stim[58] = 65'h05f965710bd71822c;
    stim[59] = 65'h079c3ea9941c7db90;
    stim[60] = 65'h09212e816ca0a1efc;
    stim[61] = 65'h0a1d1de7360e899c4;
    stim[62] = 65'h024253367408f05ef;
    stim[63] = 65'h0ffa2bb9e2eddeab7;
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
      expv[0] = 58'h000f421e5c70664;
      expv[1] = 58'h000cd6f6da1e574;
      expv[2] = 58'h000ae6a5dd49c54;
      expv[3] = 58'h07de3f37ccbab28;
      expv[4] = 58'h008cf359cc87451;
      expv[5] = 58'h162825fbc8a9e5f;
      expv[6] = 58'h07483c2e4c2d005;
      expv[7] = 58'h076984cfe84afad;
      expv[8] = 58'h00eacf862cf26f9;
      expv[9] = 58'h09ad385b1838029;
      expv[10] = 58'h0ecdc3058c49126;
      expv[11] = 58'h06c849578a38f67;
      expv[12] = 58'h3daaf4ae9d35f2c;
      expv[13] = 58'h000f1ee4aaf55ec;
      expv[14] = 58'h00089143de19071;
      expv[15] = 58'h3fbfe2230daa222;
      expv[16] = 58'h04d8929d9bf774c;
      expv[17] = 58'h121e01697a59cd5;
      expv[18] = 58'h0e9ab8245ca60e3;
      expv[19] = 58'h3d6e53fb4e8a013;
      expv[20] = 58'h0b6a7b008868e7b;
      expv[21] = 58'h06ff3cc52de48fd;
      expv[22] = 58'h03b90736993c2ae;
      expv[23] = 58'h119f1f001cfac8b;
      expv[24] = 58'h14b92b9ccddcbb1;
      expv[25] = 58'h096ef03ab8cc24f;
      expv[26] = 58'h0e2f61589bdbb64;
      expv[27] = 58'h0b199ecf6b8af52;
      expv[28] = 58'h3efcbe35ac6f59d;
      expv[29] = 58'h0f494cff5c371a7;
      expv[30] = 58'h07fdd1ec5dba552;
      expv[31] = 58'h098e94fa48d85fc;
      expv[32] = 58'h0cba605c8bbbf20;
      expv[33] = 58'h0f9958234d8c8d5;
      expv[34] = 58'h07edc52769b782e;
      expv[35] = 58'h0ccb5ea9fc723a9;
      expv[36] = 58'h05eff32789f7500;
      expv[37] = 58'h0bedbd2b3f30c0e;
      expv[38] = 58'h16bde4d5d8571a2;
      expv[39] = 58'h01cb9e12ac88274;
      expv[40] = 58'h3fb988d59a513f4;
      expv[41] = 58'h110b0fc269eed4c;
      expv[42] = 58'h09d8884489e904a;
      expv[43] = 58'h386c9f7ef8f586c;
      expv[44] = 58'h0aadbb5a1f9eaa5;
      expv[45] = 58'h01eb1a76db4c9eb;
      expv[46] = 58'h3c3c473f2e9d7c1;
      expv[47] = 58'h08e95d4f48dbfbe;
      expv[48] = 58'h082dafb97c14a2c;
      expv[49] = 58'h0799ff42fa80a22;
      expv[50] = 58'h025be4ad2815964;
      expv[51] = 58'h047e7b966c5373d;
      expv[52] = 58'h120ccbd74ef0a08;
      expv[53] = 58'h3e9ebfaa988ca7e;
      expv[54] = 58'h03e8d5796acb43f;
      expv[55] = 58'h10afd16f5f3ef29;
      expv[56] = 58'h3ef843365ca23a7;
      expv[57] = 58'h030f7b1958b4af3;
      expv[58] = 58'h059965710f1822c;
      expv[59] = 58'h0bac3ea99c7db90;
      expv[60] = 58'h0f792e8168a1efc;
      expv[61] = 58'h039d1de73e899c4;
      expv[62] = 58'h085a533678f05ef;
      expv[63] = 58'h04aa2bb9eddeab7;
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
