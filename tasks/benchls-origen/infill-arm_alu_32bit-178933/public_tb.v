// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_178933 dut (
    .a(in_vec[65:34]),
    .b(in_vec[33:2]),
    .ALUControl(in_vec[1:0]),
    .Result(out_vec[35:4]),
    .ALUFlags(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h1fb19e43fa764205c;
    stim[1] = 66'h1ce831a97963a3d13;
    stim[2] = 66'h2023dfaea30722175;
    stim[3] = 66'h198c2d6e61bd5be79;
    stim[4] = 66'h13ac2d351bc25caae;
    stim[5] = 66'h2a414fbd7fd3e26c2;
    stim[6] = 66'h066d032eb3f5c1267;
    stim[7] = 66'h3651c67cd9d62e4fd;
    stim[8] = 66'h226136970c9554aea;
    stim[9] = 66'h090f524e4c951a95d;
    stim[10] = 66'h259789c639408ff23;
    stim[11] = 66'h06334155aca6613e4;
    stim[12] = 66'h20683b886a603cfa3;
    stim[13] = 66'h2482e1fc32e87476b;
    stim[14] = 66'h2977a16a55d2de198;
    stim[15] = 66'h14690c23b967625f7;
    stim[16] = 66'h1a65a008861a7f7bb;
    stim[17] = 66'h1f2262b8531d56a18;
    stim[18] = 66'h140b32b496a0dcd0c;
    stim[19] = 66'h10801c524be482df9;
    stim[20] = 66'h23a72029f3284b28f;
    stim[21] = 66'h3be3f82aa7eadd42f;
    stim[22] = 66'h3157e523fb40acdde;
    stim[23] = 66'h117071ea3069c2601;
    stim[24] = 66'h01c585b7fc5e91461;
    stim[25] = 66'h1e039f7c407b25a2a;
    stim[26] = 66'h159fb68421db5e8ec;
    stim[27] = 66'h2de5f74d5a17bdaa6;
    stim[28] = 66'h2581f2b51f5ae8a55;
    stim[29] = 66'h36b572e3a0506e5b7;
    stim[30] = 66'h0cdf6bdac4192142f;
    stim[31] = 66'h3ac0aa05c0a5300bd;
    stim[32] = 66'h2ba2f4722488e3faf;
    stim[33] = 66'h04563603c6a4d9d67;
    stim[34] = 66'h0d6482f5f7921d918;
    stim[35] = 66'h229a1f8e67030a42e;
    stim[36] = 66'h1a390128f090b9459;
    stim[37] = 66'h2bab4e34f04a403ef;
    stim[38] = 66'h1aa1cdef11adc3f62;
    stim[39] = 66'h241bab2d0e0c93f44;
    stim[40] = 66'h1ce4f4518c74897a3;
    stim[41] = 66'h336e58e851bf11102;
    stim[42] = 66'h18e871be00c0faf99;
    stim[43] = 66'h1fd0712defd6a75e6;
    stim[44] = 66'h2abf851afdabad812;
    stim[45] = 66'h15e68d6c278974987;
    stim[46] = 66'h12fc34134c0312dc2;
    stim[47] = 66'h204ce2ace889c73d6;
    stim[48] = 66'h303fff1de3aa097cb;
    stim[49] = 66'h15182bf04c4f73e3f;
    stim[50] = 66'h141440362f4bb994c;
    stim[51] = 66'h3759b1b63ef88c7bc;
    stim[52] = 66'h3fcb3cd7019e9386b;
    stim[53] = 66'h3e53790147a28e9f9;
    stim[54] = 66'h37f0c4776dac48b36;
    stim[55] = 66'h2774a427de8323e52;
    stim[56] = 66'h0307eea07fc2e5b7f;
    stim[57] = 66'h26006ce371cb8e316;
    stim[58] = 66'h1a429a039700070c6;
    stim[59] = 66'h3d3936995b9cc837e;
    stim[60] = 66'h042f4df477c209de0;
    stim[61] = 66'h0dbd171a4f2b73ec9;
    stim[62] = 66'h19cbc055370d9eec0;
    stim[63] = 66'h11f91e6b3fe0df50e;
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
      expv[0] = 36'h689f81268;
      expv[1] = 36'hf7aecfe52;
      expv[2] = 36'hf472f65d2;
      expv[3] = 36'hdf3b461b2;
      expv[4] = 36'h4e0030800;
      expv[5] = 36'ha90508b02;
      expv[6] = 36'hdff70cbb2;
      expv[7] = 36'h71ee60b48;
      expv[8] = 36'h000452180;
      expv[9] = 36'hf1e8dee23;
      expv[10] = 36'hf75e3fd82;
      expv[11] = 36'hcb668a4f2;
      expv[12] = 36'ha9a0ffe92;
      expv[13] = 36'hdbabd7fa2;
      expv[14] = 36'hfd29fe0f2;
      expv[15] = 36'hf5bdb9ff2;
      expv[16] = 36'h79fffdee0;
      expv[17] = 36'hc8fee5673;
      expv[18] = 36'haab03e153;
      expv[19] = 36'h126e65cb8;
      expv[20] = 36'hcebdaca72;
      expv[21] = 36'hffaff5ab2;
      expv[22] = 36'hc50290072;
      expv[23] = 36'h841abe282;
      expv[24] = 36'h159bd1c70;
      expv[25] = 36'h000c14800;
      expv[26] = 36'hddec544b2;
      expv[27] = 36'h2016d4210;
      expv[28] = 36'h189c283f8;
      expv[29] = 36'hdbd5fbef2;
      expv[30] = 36'h337daf6b0;
      expv[31] = 36'he86de7e8a;
      expv[32] = 36'hbeabdfeb2;
      expv[33] = 36'h1bdbff5f0;
      expv[34] = 36'h13da821d8;
      expv[35] = 36'h880828092;
      expv[36] = 36'ha6a11f8d2;
      expv[37] = 36'hefad38fb2;
      expv[38] = 36'h428707980;
      expv[39] = 36'hc8a0fc852;
      expv[40] = 36'h73d3f5ee0;
      expv[41] = 36'h44b840000;
      expv[42] = 36'h609ddb128;
      expv[43] = 36'h3f4084310;
      expv[44] = 36'ha2ae14002;
      expv[45] = 36'hdfbff7f12;
      expv[46] = 36'h000040400;
      expv[47] = 36'h802308b12;
      expv[48] = 36'hcefffdf72;
      expv[49] = 36'h757defcf0;
      expv[50] = 36'h0d7fe72b8;
      expv[51] = 36'hd948f8c7a;
      expv[52] = 36'hff7eff5e2;
      expv[53] = 36'hdac3a987a;
      expv[54] = 36'h968100cd2;
      expv[55] = 36'h180080940;
      expv[56] = 36'hff1fbedf2;
      expv[57] = 36'h800030852;
      expv[58] = 36'h480008000;
      expv[59] = 36'h646000450;
      expv[60] = 36'hefc55f492;
      expv[61] = 36'hfa468cb73;
      expv[62] = 36'h43657d048;
      expv[63] = 36'h478079000;
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
