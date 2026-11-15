// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 98;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_083911 dut (
    .rs(in_vec[97:66]),
    .rt(in_vec[65:34]),
    .shamt(in_vec[33:29]),
    .immt(in_vec[28:7]),
    .opcode(in_vec[6:4]),
    .fcode(in_vec[3:0]),
    .inp1(out_vec[63:32]),
    .inp2(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 98'h3634701819bc65c9c802d9b41;
    stim[1] = 98'h2d434482149ca29f6d9661717;
    stim[2] = 98'h340be38785f77fcb23862486e;
    stim[3] = 98'h37fb61a0bf4fa00c60353e9ad;
    stim[4] = 98'h1f0912452eb2fa55a1ac3f2a4;
    stim[5] = 98'h19f28a77ef9c9b0a5f9cecd66;
    stim[6] = 98'h048ee7548bbd7f8b7692aec9f;
    stim[7] = 98'h07ddd1c5159c1d26709eff61a;
    stim[8] = 98'h3d3b64136629a831bf003b1c8;
    stim[9] = 98'h2a27849d5ba587600b01500d1;
    stim[10] = 98'h13e1b7b48b4f6761216b69d99;
    stim[11] = 98'h3008741e035702850349bab09;
    stim[12] = 98'h176c79581b5b03c8c1f123a5b;
    stim[13] = 98'h19d63e99471a86936c1c8dde0;
    stim[14] = 98'h082794c93f4b2bac24527990c;
    stim[15] = 98'h1f3fc62cb6e54e0e35b5b2682;
    stim[16] = 98'h151ca64655b463dcd192c2fb3;
    stim[17] = 98'h3fbf6676f58c3e224b9f7bc60;
    stim[18] = 98'h1cb85b14c2d15822ef29dbc85;
    stim[19] = 98'h0d9cd8734a4e9795f9487dbd5;
    stim[20] = 98'h1d8e285d9c7a26082b1ad6e8f;
    stim[21] = 98'h0a0e30507c613b6636bfd58fe;
    stim[22] = 98'h26d3f7dc3e41ce337c75c6890;
    stim[23] = 98'h026f64d6835ab397f0d80a818;
    stim[24] = 98'h1c56712e82bae449a0175a29f;
    stim[25] = 98'h391e7f754d0e13045dca8f6af;
    stim[26] = 98'h3cf70f88013c665630923a9f4;
    stim[27] = 98'h1d396c6460ad37dd64c323a4d;
    stim[28] = 98'h296ee6a9e1427615516510573;
    stim[29] = 98'h0fa0ed161d39239a876a55d73;
    stim[30] = 98'h3fbc323bb9e2d1644dcde6741;
    stim[31] = 98'h3250a242f870fbfc32ae61bb4;
    stim[32] = 98'h35bab9685555e97cad8c9dada;
    stim[33] = 98'h20d6ab9b0a75f903928818c3d;
    stim[34] = 98'h028083225d812f80ea6dd3951;
    stim[35] = 98'h18ab5159a82e983b97d19db24;
    stim[36] = 98'h07f666fb746452b52091d44b7;
    stim[37] = 98'h3b3d2004686cf42a8775a0891;
    stim[38] = 98'h1ac76f1303a917a38ab9cf2e0;
    stim[39] = 98'h130100d65f619980b765ca5ec;
    stim[40] = 98'h244a55851cf29f8b56cd89b2a;
    stim[41] = 98'h2edc0c95e10a35db2544e3d5d;
    stim[42] = 98'h27f5eda1cb9ada811e4675dbd;
    stim[43] = 98'h015a397b14574c7b3b15537d6;
    stim[44] = 98'h06708cd3f2a1b05de510d1e6d;
    stim[45] = 98'h1baff83eb851e964288c4aafd;
    stim[46] = 98'h185289c5b29bc150764285ae1;
    stim[47] = 98'h29dd5eddf3464526effc03155;
    stim[48] = 98'h2467f5331f463c29750681665;
    stim[49] = 98'h12b815cdee6fa35435adc35a7;
    stim[50] = 98'h327dc9b15086768f415015ac4;
    stim[51] = 98'h05996e83d1f5ea1e17fd85eb0;
    stim[52] = 98'h2bc68ce93df35bf784f07de80;
    stim[53] = 98'h1a4bf9a8e2d066bdc09bd9ba5;
    stim[54] = 98'h0d567e591809a926462143bd0;
    stim[55] = 98'h37911c5d0dd40e29267c6ae02;
    stim[56] = 98'h0edb1c6e0cb41ea9b3c59cb8c;
    stim[57] = 98'h2efe7672c735a98e112a7de84;
    stim[58] = 98'h17cc265eb72c4ad4aa7fb2530;
    stim[59] = 98'h0ea19f1a38cbd7ad715811c71;
    stim[60] = 98'h164119f9546c900442ca98fa6;
    stim[61] = 98'h369e217d98b3827463bed308d;
    stim[62] = 98'h10e6256502170f7fcc651f761;
    stim[63] = 98'h202bf29de4d5bc4a3469e43e9;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'hb50d1208fff2cc2e;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'h0000000000000000;
      expv[5] = 64'h0000000000000000;
      expv[6] = 64'h123b9d52001255d9;
      expv[7] = 64'h1f7747140013dfec;
      expv[8] = 64'h0000000000000000;
      expv[9] = 64'h0000000000000000;
      expv[10] = 64'h4f86ded2ffed6d3b;
      expv[11] = 64'hc021d0780d5c0a14;
      expv[12] = 64'h0000000000000000;
      expv[13] = 64'h0000000000000000;
      expv[14] = 64'h209e532400000012;
      expv[15] = 64'h7cff18b2db953838;
      expv[16] = 64'h0000000000000000;
      expv[17] = 64'h0000000000000000;
      expv[18] = 64'h72e16c530b45608b;
      expv[19] = 64'h0000000000000000;
      expv[20] = 64'h7638a17600000015;
      expv[21] = 64'h0000000000000000;
      expv[22] = 64'h9b4fdf70000eb8d1;
      expv[23] = 64'h09bd935a001b0150;
      expv[24] = 64'h7159c4ba0002eb45;
      expv[25] = 64'h0000000000000000;
      expv[26] = 64'h0000000000000000;
      expv[27] = 64'h0000000000000000;
      expv[28] = 64'h0000000000000000;
      expv[29] = 64'h0000000000000000;
      expv[30] = 64'h0000000000000000;
      expv[31] = 64'h0000000000000000;
      expv[32] = 64'h0000000000000000;
      expv[33] = 64'h0000000000000000;
      expv[34] = 64'h0000000000000000;
      expv[35] = 64'h0000000000000000;
      expv[36] = 64'h0000000000000000;
      expv[37] = 64'hecf48011ffeeb411;
      expv[38] = 64'h0000000000000000;
      expv[39] = 64'h0000000000000000;
      expv[40] = 64'h0000000000000000;
      expv[41] = 64'h0000000000000000;
      expv[42] = 64'h0000000000000000;
      expv[43] = 64'h0000000000000000;
      expv[44] = 64'h0000000000000000;
      expv[45] = 64'h0000000000000000;
      expv[46] = 64'h0000000000000000;
      expv[47] = 64'h0000000000000000;
      expv[48] = 64'h0000000000000000;
      expv[49] = 64'h0000000000000000;
      expv[50] = 64'h0000000000000000;
      expv[51] = 64'h0000000000000000;
      expv[52] = 64'haf1a33a4f7cd6fde;
      expv[53] = 64'h0000000000000000;
      expv[54] = 64'h0000000000000000;
      expv[55] = 64'hde447174375038a4;
      expv[56] = 64'h3b6c71b800000019;
      expv[57] = 64'hbbf9d9cb1cd6a638;
      expv[58] = 64'h0000000000000000;
      expv[59] = 64'h0000000000000000;
      expv[60] = 64'h0000000000000000;
      expv[61] = 64'hda7885f600000011;
      expv[62] = 64'h0000000000000000;
      expv[63] = 64'h0000000000000000;
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
