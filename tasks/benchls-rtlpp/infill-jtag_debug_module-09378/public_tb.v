// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 122;
  localparam OW = 53;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09378 dut (
    .clk(clk),
    .MonDReg(in_vec[121:90]),
    .break_readreg(in_vec[89:58]),
    .dbrk_hit0_latch(in_vec[57:57]),
    .dbrk_hit1_latch(in_vec[56:56]),
    .dbrk_hit2_latch(in_vec[55:55]),
    .dbrk_hit3_latch(in_vec[54:54]),
    .debugack(in_vec[53:53]),
    .monitor_error(in_vec[52:52]),
    .monitor_ready(in_vec[51:51]),
    .reset_n(in_vec[50:50]),
    .resetlatch(in_vec[49:49]),
    .tracemem_on(in_vec[48:48]),
    .tracemem_trcdata(in_vec[47:12]),
    .tracemem_tw(in_vec[11:11]),
    .trc_im_addr(in_vec[10:4]),
    .trc_on(in_vec[3:3]),
    .trc_wrap(in_vec[2:2]),
    .trigbrktype(in_vec[1:1]),
    .trigger_state_1(in_vec[0:0]),
    .jdo(out_vec[52:15]),
    .jrst_n(out_vec[14:14]),
    .st_ready_test_idle(out_vec[13:13]),
    .take_action_break_a(out_vec[12:12]),
    .take_action_break_b(out_vec[11:11]),
    .take_action_break_c(out_vec[10:10]),
    .take_action_ocimem_a(out_vec[9:9]),
    .take_action_ocimem_b(out_vec[8:8]),
    .take_action_tracectrl(out_vec[7:7]),
    .take_action_tracemem_a(out_vec[6:6]),
    .take_action_tracemem_b(out_vec[5:5]),
    .take_no_action_break_a(out_vec[4:4]),
    .take_no_action_break_b(out_vec[3:3]),
    .take_no_action_break_c(out_vec[2:2]),
    .take_no_action_ocimem_a(out_vec[1:1]),
    .take_no_action_tracemem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 122'h1e28c115684852157eb081bc4421416;
    stim[1] = 122'h30c9311487f2cfe45e3fc5c661711e0;
    stim[2] = 122'h0ea3ed1b6b813401ea7c1d68335ac1c;
    stim[3] = 122'h370f18e0cbc0ddbf1ac7acf959aacd9;
    stim[4] = 122'h0a5823b72c6afcabb061f8306b885cd;
    stim[5] = 122'h157f22829530e36c0c4ef1a5a085a22;
    stim[6] = 122'h385801c6dc0f82a6e2f687a054abe46;
    stim[7] = 122'h296ce70ea87e7c4b5f683225f444d59;
    stim[8] = 122'h32e20bfdaf6686243fc347bf970f4c7;
    stim[9] = 122'h00b8ddf55a5021f055c6505aa813e55;
    stim[10] = 122'h20149b74fba11d26f64642ca4810382;
    stim[11] = 122'h0c1ded8c3617fdcac7454347f9647f4;
    stim[12] = 122'h3a0a2b9bdde184a794c454c14e34d06;
    stim[13] = 122'h10cbd4b41cb5d0cc7b7c4f5d4af2fc6;
    stim[14] = 122'h0b4c377fda0959d06a7d82d9f948856;
    stim[15] = 122'h22d24f34a9c123341e5ff3b6952c60c;
    stim[16] = 122'h0289c50d9fb695a4e16b46a52104163;
    stim[17] = 122'h16db9267f58d5d443a5d6eee8bb3268;
    stim[18] = 122'h28d7fed0494a83e0645d9f5b728c892;
    stim[19] = 122'h361a07c8edf53d6bf96150299907b30;
    stim[20] = 122'h0f2f6b1b7e75ebe68be7b193254be20;
    stim[21] = 122'h1abda7fd700aeedf434180526f05087;
    stim[22] = 122'h169077f61b27ee40a76de48dfb88523;
    stim[23] = 122'h0179da562fffd9c8cb4449494b87b63;
    stim[24] = 122'h027e2dde746483f4e3d5855f615c474;
    stim[25] = 122'h2feda9b709506f469b483eb5861f0ca;
    stim[26] = 122'h1fd06d31bd42e5fd11ee5b682822bc7;
    stim[27] = 122'h11ca1468e0d0379bf65f2e180f5908e;
    stim[28] = 122'h3e6eef7b6ac34e7f065657d47b12ab8;
    stim[29] = 122'h115f436caa280250d9e1eee808c0af7;
    stim[30] = 122'h0885fc73b2cbadf0657b3e7c8737331;
    stim[31] = 122'h100cc698bd383b2b0bcf6da76202e69;
    stim[32] = 122'h24bf3538a4f6454ac77caac04b5b8d1;
    stim[33] = 122'h3946918a75d592558bfb9cc440c0e79;
    stim[34] = 122'h09b0f2a32c7a7bea9a67a7a25d1c17d;
    stim[35] = 122'h05b00195806972261d4a1da487ba3db;
    stim[36] = 122'h3428e4f70c821a011d5b818318d7c8d;
    stim[37] = 122'h0c4451a57b75a4de82e9526d826be06;
    stim[38] = 122'h1356f1f832774268537fc01a37db203;
    stim[39] = 122'h3a911b689e0a3d8651467fcd01dacc6;
    stim[40] = 122'h29f0909a6ae60cfa536dbe0a4dc7912;
    stim[41] = 122'h2f6ab8acefd4c64adf750a651db6ab2;
    stim[42] = 122'h030a28ef4fb43547746bfc8a7d76396;
    stim[43] = 122'h38e1fd99db23905fbc376756a1f013c;
    stim[44] = 122'h31d736e3cd25c34a30e11e96459748f;
    stim[45] = 122'h3a5b1c7ff99a14963a4dbab630886de;
    stim[46] = 122'h21961136d8d0cee4a6ca763b3471423;
    stim[47] = 122'h02eacc57c55a0647efe70cb3343f28d;
    stim[48] = 122'h2be5720b60ae61996be6ca073e3eeef;
    stim[49] = 122'h09b375950c82f8c4a1d1f96fa2fd68c;
    stim[50] = 122'h3d81b1211470c7f49340f56903290f2;
    stim[51] = 122'h0a0ce218c10908cf1fe8792b0e57c43;
    stim[52] = 122'h126b5c0d76bb2bc710f2146551d2358;
    stim[53] = 122'h186e9b818ebecd237ee7c62051b317f;
    stim[54] = 122'h1e50f02b4f1e354ddf648e755b53ba0;
    stim[55] = 122'h2f7c8895bf47bc8df1cc5bcbab4f531;
    stim[56] = 122'h196f24c39f046162e9ce2202f81e285;
    stim[57] = 122'h38350d4b210f083f404e526976d0042;
    stim[58] = 122'h06d16f7e9a8f1550d2db24b48986665;
    stim[59] = 122'h209044a8a533bc5fef76b46be44f7b1;
    stim[60] = 122'h3b4704128ba5d387ab552698fc05f8f;
    stim[61] = 122'h269e89473cf88af48fdbf3a9ac9205e;
    stim[62] = 122'h3524568dbd7ac15ea8f25ca5b24f36e;
    stim[63] = 122'h1da4fd5bce891a981c608730d56b334;
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
      expv[0] = 53'h00000000002000;
      expv[1] = 53'h00000000000000;
      expv[2] = 53'h00000000004000;
      expv[3] = 53'h039d47da36f5ff;
      expv[4] = 53'h1e6e1e31c1cd4a;
      expv[5] = 53'h1714b0476e5872;
      expv[6] = 53'h182afe45056706;
      expv[7] = 53'h0df0b0038dd1b9;
      expv[8] = 53'h16d2d9ce1d4f4f;
      expv[9] = 53'h0865c417fb5e30;
      expv[10] = 53'h008171bbeacb21;
      expv[11] = 53'h0dc02936e9da15;
      expv[12] = 53'h15983bdb186225;
      expv[13] = 53'h0f74145737cb3d;
      expv[14] = 53'h18a197a9685db5;
      expv[15] = 53'h0096986effd5a3;
      expv[16] = 53'h0845a49e694eeb;
      expv[17] = 53'h0985138a1b5010;
      expv[18] = 53'h082db724cfdccf;
      expv[19] = 53'h00d1affda0d382;
      expv[20] = 53'h17ec340f91dd0d;
      expv[21] = 53'h0d1e5ed636c503;
      expv[22] = 53'h1eb57b4ffac03b;
      expv[23] = 53'h012d20efec521f;
      expv[24] = 53'h1182f3b4ac450d;
      expv[25] = 53'h0984fc5bbcd0bb;
      expv[26] = 53'h0d5fdb536e4c4f;
      expv[27] = 53'h1a3fa0da634932;
      expv[28] = 53'h17a39428d1daf7;
      expv[29] = 53'h1e7cdddef6c3c4;
      expv[30] = 53'h01a2be86d94d3c;
      expv[31] = 53'h00910bf8e75293;
      expv[32] = 53'h1620198d31454d;
      expv[33] = 53'h15c97e6a71439a;
      expv[34] = 53'h0b728d2314c5dd;
      expv[35] = 53'h151361e5464c7a;
      expv[36] = 53'h0c0b60032b4e52;
      expv[37] = 53'h026851c9ee6ff0;
      expv[38] = 53'h1d1888a34ac130;
      expv[39] = 53'h10a6ade3f0489f;
      expv[40] = 53'h0cf52236d14937;
      expv[41] = 53'h14d3e12134c917;
      expv[42] = 53'h15ded57159cf97;
      expv[43] = 53'h00000000000000;
      expv[44] = 53'h00000000006000;
      expv[45] = 53'h1463ae6dc7d87f;
      expv[46] = 53'h0c74b638fffc66;
      expv[47] = 53'h09432c226dd202;
      expv[48] = 53'h0f85d598afd66d;
      expv[49] = 53'h12d7cae416d568;
      expv[50] = 53'h091366eb2a50ea;
      expv[51] = 53'h097b036242480e;
      expv[52] = 53'h1e1419c431ef17;
      expv[53] = 53'h0e24d6b81ae8d1;
      expv[54] = 53'h06b0dd37035e76;
      expv[55] = 53'h1bbca1e056cf00;
      expv[56] = 53'h1bdef9112b5811;
      expv[57] = 53'h05b2de49875427;
      expv[58] = 53'h1ef06a1a96600b;
      expv[59] = 53'h018da2defd48bf;
      expv[60] = 53'h1fc12089515697;
      expv[61] = 53'h0f768e082555e9;
      expv[62] = 53'h094d3d128e66ea;
      expv[63] = 53'h1d6a48ad1b54f8;
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
